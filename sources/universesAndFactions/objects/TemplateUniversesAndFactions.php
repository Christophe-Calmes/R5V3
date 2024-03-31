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
    public function dashboardAdminUnivers () {
        $validUniverses = $this->numberOfUniversDashboard (1);
        $invalidUniverses = $this->numberOfUniversDashboard (0);
        $totalUniverses = $this->totalNumberOfUniversDashboard ();
        $averageLT = $this->avgTLUnivers ();
        $numberOfMembre = $this->totalUser ();
        echo '<ul class="listeProfil sizeFont">';
        echo '<h2 class="subTitleSite">Dashboard Univers</h2>';
            echo '<li>Total number of members : '.$numberOfMembre.'</li>';
            echo '<li>Total number of universes :'.$totalUniverses.' </li>';
            echo '<li>Percentage of valid universe :'.round(($validUniverses/$totalUniverses)*100).' % </li>';
            echo '<li>Percentage of valid universe :'.round((($invalidUniverses/$totalUniverses)*100), 2).' % </li>';
            echo '<li>Average Level Technologic : '.round($averageLT, 2).' / 12</li>';
            echo '<li>Average number of valid universes per user : '.round(($validUniverses/$numberOfMembre),2).'</li>';
            echo '<li>Average number of invalid universes per user : '.round(($invalidUniverses/$numberOfMembre),2).'</li>';
        echo '</ul>';
    }
}