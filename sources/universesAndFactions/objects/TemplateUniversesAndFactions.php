<?php
require('sources/universesAndFactions/objects/SQLuniversesAndFactions.php');
require('functions/functionDateTime.php');
Class TemplateUniversesAndFactions extends SQLuniversesAndFactions {
    private $yes;

    public function __construct()
    {
        $this->yes = ['No', 'Yes'];
    }
    public function displayAndAdminOneUnivers ($data, $idNav, $message) {
        echo '<div class="item">';
            echo'<ul class="listeProfil sizeFont">';
                echo '<li>Owner : '.$data['login'].'</li>';
                echo '<li class="subTitleSite">Name : '.$data['name_Univers'].'</li>';
                echo '<li>Creation date : '.brewingDate($data['date_Creat']).'</li>';
                echo '<li>Technologic level (TL) : '.$data['NT'].' </li>';
                echo '<li>Statues : '.$this->yes[$data['valid']].' </li>';
            echo '</ul>';
            if($_SESSION['role']== 1) {
                echo '<a href="'.findTargetRoute(146).'&idUniverse='.$data['id'].'">Update</a>';
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
            }
            if($_SESSION['role'] == 3) {
                echo '<form action="'.encodeRoutage(66).'" method="post">
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
    public function paginationUnivers ($premier, $parPage, $idNav) {
        $dataUnivers = $this->selectOnePageOfUniverses($premier, $parPage);
        echo '<article class="gallery">';
        foreach($dataUnivers as $value) {
            $this->displayAndAdminOneUnivers ($value, $idNav, 'Administration');
        }
        echo '</article>';
    }
    public function updateUniverse ($param, $idNav) {
        $data = $this->selectOneUnivers ($param);
        if(!empty($data)) {
    echo  '<h2 class="subTitleSite">Change '.$data[0]['name_Univers'].'</h2>';
    echo '<form class="formulaireClassique" action="'.encodeRoutage(67).'" method="post">
            <label for="name_Univers">Change name of your universe</label>
            <input type="text" id="name_Univers" name="name_Univers" value="'.$data[0]['name_Univers'].'"/>
            <label for="NT">Technology level</label>
            <input type="number" id="NT"  name="NT" min="1" max="12" value="'.$data[0]['NT'].'" />
            <p>Creation date : '.brewingDate($data[0]['date_Creat']).'</p>
            <p>Update date : '.brewingDate($data[0]['date_Update']).'</p>
            <input type="hidden" name="idUniverse" value="'.$data[0]['id'].'"/> 
            <button type="submit" name="idNav" value="'.$idNav.'">Update</button>
            </form>';
        } else {
            echo '<h2>No find your universe</h2>';
        }
    }
    public function setNumberOfUniversCreatingByOneUser () {
        echo '<p>You can create up to  '.$this->numberUniverseByUser.' universes.</p>';
    }
}