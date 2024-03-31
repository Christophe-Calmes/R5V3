<?php
require('sources/universesAndFactions/objects/SQLuniversesAndFactions.php');
require('functions/functionDateTime.php');
Class TemplateUniversesAndFactions extends SQLuniversesAndFactions {
    public function displayAndAdminOneUnivers ($data, $idNav, $message) {
        echo '<div class="item">';
            echo'<ul class="listeProfil sizeFont">';
                echo '<li class="subTitleSite">Name : '.$data['name_univers'].'</li>';
                echo '<li>Creation date : '.brewingDate($data['date_Creat']).'</li>';
                echo '<li>Technologic level (TL) : '.$data['NT'].' </li>';
            echo '</ul>';
            echo '<form action="'.encodeRoutage(62).'" method="post">
                    <input type="hidden" name="id" value="'.$data['id'].'"/>
                    <button class="buttonForm" type="submit" name="idNav" value="'.$idNav.'">'.$message.'</button>
                </form>';
            if($data['valid'] == 0) {
                echo '<form action="'.encodeRoutage(63).'" method="post">
                        <input type="hidden" name="id" value="'.$data['id'].'"/>
                    <button class="buttonForm red" type="submit" name="idNav" value="'.$idNav.'">Delete</button>
            </form>';
            }
        echo '</div>';
    }


    public function displayUniversOfConnectedUser ($id_Author, $valid, $idNav) {
        $data = $this->selectUniversOfOneUser($id_Author, $valid);
        if(!empty($data)) {
            if($valid == 1) {
                echo '<h2 class="subTitleSite">Valid universes</h2>';
                $message = 'Invalid';
            } else {
                echo '<h2 class="subTitleSite">Invalid universes</h2>';
                $message = "Valid";
            }
            echo '<article class="gallery">';
            for ($i=0; $i < count($data) ; $i++) { 
               $this->displayAndAdminOneUnivers ($data[$i], $idNav, $message);
            }
            echo '</article>';
        }
    }
}