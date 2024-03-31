<?php
Class SQLuniversesAndFactions {
    public function updateValidStatusUniverse ($param) {
        $update ="UPDATE `universes`
        SET `valid` = CASE WHEN `valid` = 1 THEN 0 ELSE 1 END,
        `date_Update` = CURRENT_TIMESTAMP
        WHERE `id`=:id AND`id_Author`=:idUser;";
        return ActionDB::access($update, $param, 1);
    }
    public function deleteInvalidStatusUniverse ($param) {
        $update ="DELETE FROM `universes`
        WHERE `id`=:id AND`id_Author`=:idUser;";
        return ActionDB::access($update, $param, 1);
    }
    public function numberOfUnivers ($id_Author) {
        $countUnivers = "SELECT COUNT(`id`) AS `numberOfUniverses` 
        FROM `universes` 
        WHERE `id_Author` = :id_Author";
        $param = [['prep'=>':id_Author', 'variable'=> $id_Author]];
        $countUnivers = ActionDB::select($countUnivers, $param, 1);
        if($countUnivers[0]['numberOfUniverses'] >= 5) {
            return false;
        } else {
            return true;
        }
    }
    public function creatUniverses ($post) {
        $ok = $this->numberOfUnivers($post['id_Author']);
        if($ok) {
            $sqlInsert = new InsertRequest();
            $insert = $sqlInsert->requestInsert($post, 3, 'universes', 1);
            $parametre = new Preparation ();
            $param = $parametre->creationPrep ($post);
            ActionDB::access($insert, $param, 1);
            return true;
        } else {
            return false;
        }
    }
    protected function selectUniversOfOneUser($id_Author, $valid) {
        $set = [['champs'=>'id_Author', 'operator'=>'=', 'param'=>':id_Author'],
                ['champs'=>'valid', 'operator'=>'=', 'param'=>':valid']];
        $fields = ['id','name_univers', 'NT', 'date_Creat', 'date_Update', 'valid'];
        $table = 'universes';
        $sql = new SelectRequest($fields, $table, $set);
        $select = $sql->requestSelect(0);
        $param = [['prep'=>':id_Author', 'variable'=> $id_Author],
                ['prep'=>':valid', 'variable'=> $valid], ];
        return ActionDB::select($select, $param, 1);
    }
    protected function numberOfUniversDashboard ($valid) {
        $select = "SELECT COUNT(`id`) AS `numberOfUnivers` FROM `universes` WHERE `valid` = :valid;";
        $param = [['prep'=>':valid', 'variable'=> $valid]];
        $data = ActionDB::select($select, $param, 1);
        return $data[0]['numberOfUnivers'];
    }
    protected function totalNumberOfUniversDashboard () {
        $select = "SELECT COUNT(`id`) AS `numberOfUnivers` FROM `universes`;";
        $data = ActionDB::select($select, [], 1);
        return $data[0]['numberOfUnivers'];
    }
    protected function avgTLUnivers () {
        $select = "SELECT  AVG(`NT`) AS `averageTL` FROM `universes` WHERE `valid` = 1;";
        $data = ActionDB::select($select, [], 1);
        return $data[0]['averageTL'];
    }
    protected function totalUser () {
        $select = "SELECT COUNT(`idUser`) AS `numberOfMembre` FROM `users` WHERE `valide` = 1 AND `role` = 1;";
        $data = ActionDB::select($select, [], 0);
        return $data[0]['numberOfMembre'];
    }
}