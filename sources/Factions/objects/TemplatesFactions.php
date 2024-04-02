<?php
require ('functions/functionDateTime.php');
require('sources/Factions/objects/SQLFactions.php');
Class TemplateFactions extends SQLFactions {
    private function selectedYes ($message, $name, $value) {
        echo '<label for="'.$name.'">'.$message.'</label>';
        echo '<select id="'.$name.'" name="'.$name.'">';
        $yes = ['No', 'Yes'];
        for ($i=0; $i < count($yes) ; $i++) { 
            if($value == $i) {
                echo '<option value="'.$i.'" selected>'.$yes[$i].'</option>';
            } else {
                echo '<option value="'.$i.'">'.$yes[$i].'</option>';
            }
        }
        echo '</select>';
    }

    public function TemplateFormNewFaction ($idNav) {
        $id_Author = $this->getIdUser ();
        $dataUnivers = $this->selectUniversOfOneUser($id_Author, 1);
        if(!empty($dataUnivers)) {
            // encodeRoutage(68)
            echo  '<h2 class="subTitleSite">Add a new faction</h2>';
            echo '<form class="formulaireClassique" action='.encodeRoutage(68).' method="post">';
                    echo '<label for="id_Universe">Faction universe</label>';
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
    public function displayAdminFactionsByUser($valid) {
        if($valid == 1) {
            $title = '<h2 class="subTitleSite">Valid factions</h2>';
        } else {
            $title = '<h2 class="subTitleSite">Invalid factions</h2>';
        }
        $data = $this->getFactionOfOneUnivers($valid);
        $universes = array();
        foreach($data as $row) {
           $universe = $row['name_Univers'];
           if (!isset($universes[$universe])) {
            $universes[$universe] = [];
          }
          $universes[$universe][] = ['idFaction'=>$row['idFaction'], 'nameFaction'=>$row['name_Factions']];

        }
        if(!empty($data)) {echo $title;}
        foreach($universes as $key => $value) {
            echo '<ul class="listNoStyle">';
            echo '<li><h2 class="subTitleSite">'.$key.' : '.count($value).'/'.$this->numberMaxOfFactionsForOneUniverses.' factions created</h2></li>';
            for ($i=0; $i <count($value) ; $i++) { 
                echo '<li><a href="'.findTargetRoute(149).'&idFaction='.$value[$i]['idFaction'].'">'.$value[$i]['nameFaction'].'</a></li>';
         
            }
            echo '</ul>';
        }
    }
    public function updateFormFaction ($idFaction, $idNav) {
        $dataFaction = $this->getOneFaction ($idFaction);
        $id_Author = $this->getIdUser ();
        $dataUnivers = $this->selectUniversOfOneUser($id_Author, 1);
            // encodeRoutage(68)
            echo  '<h2 class="subTitleSite">Add a new faction</h2>';
            echo '<article>
                    <h3>Informations</h3>
                        <p>Creat date : '.brewingDate($dataFaction[0]['date_Creat']).'</p>
                        <p>Udate date : '.brewingDate($dataFaction[0]['date_Update']).'</p>
                   </article>';
                   echo '<form class="formulaireClassique" action='.encodeRoutage(69).' method="post">';
                    echo '<label for="name_Factions">Name of faction : '.$dataFaction[0]['name_Factions'].'</label>';
                    echo '<input type="text" id="name_Factions" name="name_Factions" value="'.$dataFaction[0]['name_Factions'].'" required/>';
                    echo '<label for="id_Universe">Faction universe</label>';
                        echo '<select id="id_Universe" name="id_Universe">';
                        foreach($dataUnivers as $value) {
                            if($dataFaction[0]['id_Universe'] == $value['id']) {
                                echo '<option value="'. $value['id'].'" selected>'.$value['name_Univers'].'</option>';
                            } else {
                                echo '<option value="'. $value['id'].'">'.$value['name_Univers'].'</option>';
                            }
                        }
                        echo '</select>';
                        $this->selectedYes ('Faction valid ?', 'valid', $dataFaction[0]['valid']);
                    echo '<input type="hidden" name="id" value="'.$dataFaction[0]['id'].'"/>';
                    echo '<button type="submit" name="idNav" value="'.$idNav.'">Update faction</button>'; 
            echo '</form>';
     
    }
        
}