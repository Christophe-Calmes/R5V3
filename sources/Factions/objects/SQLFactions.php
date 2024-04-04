<?php

Class SQLFactions  {
    protected $numberMaxOfFactionsForOneUniverses = 6;

    public function __construct()
    {
        $this->numberMaxOfFactionsForOneUniverses;
    }

    protected function selectUniversOfOneUser($id_Author, $valid) {
        $set = [['champs'=>'id_Author', 'operator'=>'=', 'param'=>':id_Author'],
                ['champs'=>'valid', 'operator'=>'=', 'param'=>':valid']];
        $fields = ['id','name_Univers', 'NT', 'date_Creat', 'date_Update', 'valid'];
        $table = 'universes';
        $sql = new SelectRequest($fields, $table, $set);
        $select = $sql->requestSelect(0);
        $param = [['prep'=>':id_Author', 'variable'=> $id_Author],
                ['prep'=>':valid', 'variable'=> $valid], ];
        return ActionDB::select($select, $param, 1);
    }
    public function OwnershipOfUniverse ($idUnivers) {
        $post['idUniverse'] = $idUnivers;
        $select = "SELECT COUNT(`id`) AS `number` 
        FROM `universes` 
        WHERE `id_Author` = :idUser AND `id`= :idUniverse AND `valid` = 1;";
        $parametre = new Preparation ();
        $param = $parametre->creationPrepIdUser ($post);
        $data = ActionDB::select($select, $param, 1);
        if($data[0]['number'] == 1) {
            return 1;
        } else {
            return 0;
        }
    }
    private function limitOfFactionsForOneUniverse ($param) {
        unset($param[1]);
        print_r($param);
       $select = "SELECT COUNT(`id`) AS `numberOfFactions` 
        FROM `factions` 
        WHERE `id_Universe` = :id_Universe AND `id_Author`= :idUser;";
        $data = ActionDB::select($select, $param, 1);
       if($data[0]['numberOfFactions'] >= $this->numberMaxOfFactionsForOneUniverses) {
            return false;
        } else {
            return true;
        }
    }
    public function insertNewFaction ($param) {
        if($this->limitOfFactionsForOneUniverse ($param)) {
            $insert = "INSERT INTO `factions`(`name_Factions`, `id_Universe`, `id_Author`) 
            VALUES 
            (:name_Factions, :id_Universe, :idUser)";
             ActionDB::access($insert, $param, 1);
             return true;
        } else {
            return false;
        }
       
    }
    protected function getIdUser () {
        $checkId = new Controles ();
        return $checkId->idUser($_SESSION);
    }
    protected function getFactionOfOneUnivers ($valid) {
        $idUser = $this->getIdUser();
        $select = "SELECT universes.name_Univers, factions.name_Factions, factions.id AS idFaction
        FROM universes
        INNER JOIN factions ON universes.id = id_Universe
        WHERE factions.valid = :valid AND factions.id_Author = :id_Author
        ORDER BY  factions.name_Factions, universes.name_Univers DESC;";
        $param = [['prep'=>':id_Author', 'variable'=>$idUser], 
                    ['prep'=>':valid', 'variable'=> $valid],];
        return ActionDB::select($select, $param , 1);
    }
    protected function getOneFaction ($idFaction) {
        $idUser = $this->getIdUser();
        $param = [['prep'=>':idUser', 'variable'=>$idUser], 
                  ['prep'=>':idFaction', 'variable'=>$idFaction]];
        $select = "SELECT `id`, `name_Factions`, `id_Author`, `id_Universe`, `date_Creat`, `date_Update`, `valid` 
                    FROM `factions` 
                    WHERE `id` =:idFaction AND `id_Author`=:idUser;";
        return ActionDB::select($select, $param, 1);
    }
    public function updateFactionByUser ($param) {
        $update = "UPDATE `factions` 
        SET `name_Factions`=:name_Factions,`id_Universe`=:id_Universe, `date_Update`= CURRENT_TIMESTAMP,`valid`=:valid 
        WHERE `id` = :id AND `id_Author`=:idUser ";
        return ActionDB::access($update, $param, 1);
    }
    public function deleteFactionByUser ($param) {
        $delete = "DELETE FROM `factions` WHERE `id` = :id AND `valid` = 0 AND `id_Author`=:idUser;";
        return ActionDB::access($delete, $param, 1);
    }
}