<?php
require ('sources/universesAndFactions/objects/SQLuniversesAndFactions.php');
Class SQLFactions extends SQLuniversesAndFactions {
    protected function selectUniversOfUser () {
        $checkUser = new Controles ();
        $idUser = $checkUser->idUser($_SESSION);
        
    }
}