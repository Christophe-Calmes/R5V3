<?php
require('sources/Factions/objects/SQLFactions.php');
Class TemplateFactions extends SQLFactions {
    public function TemplateFormNewFaction ($idNav) {
        $checkId = new Controles ();
        $id_Author = $checkId->idUser($_SESSION);
        $dataUnivers = $this->selectUniversOfOneUser($id_Author, 1);
        if(!empty($dataUnivers)) {
            // encodeRoutage(68)
            echo  '<h2 class="subTitleSite">Add a new faction</h2>';
            echo '<form class="formulaireClassique" action='.encodeRoutage(68).' method="post">';
                    echo '<label for="id_Universe">Univers de la faction</label>';
                        echo '<select id="id_Universe" name="id_Universe">';
                        foreach($dataUnivers as $value) {
                            echo '<option value="'. $value['id'].'">'.$value['name_Univers'].'</option>';
                        }
                        echo '</select>';
                    echo '<label for="name_Factions">Name of new faction</label>';
                    echo '<input type="text" id="name_Factions" name="name_Factions" placeholder="name of new faction" required/>';
                    echo '<button type="submit" name="idNav" value="'.$idNav.'">Creat new faction</button>'; 
            echo '</form>';
        } else {
            echo '<h2 class="subTitleSite">No universe find</h2>';
        }
    }
    public function displayFactionsByUser($valid) {
        $data = $this->getFactionOfOneUnivers($valid);
        $universes = array();
        foreach($data as $row) {
           $universe = $row['name_Univers'];
           if (!isset($universes[$universe])) {
            $universes[$universe] = [];
          }
          $universes[$universe][] = ['idFaction'=>$row['idFaction'], 'nameFaction'=>$row['name_Factions']];

        }
        foreach($universes as $key => $value) {
            echo '<ul class="listNoStyle">';
            echo '<li><h2 class="subTitleSite">'.$key.' : '.count($value).'/'.$this->numberMaxOfFactionsForOneUniverses.' factions created</h2></li>';
           
            for ($i=0; $i <count($value) ; $i++) { 
                echo '<li>'.$value[$i]['nameFaction'].'</li>';
         
            }
            echo '</ul>';
        }
     
    }
        
}