<?php
$checkUser = new Controles();
$id_Author = $checkUser->idUser($_SESSION);
require('sources/universesAndFactions/objects/TemplateUniversesAndFactions.php');
$universe = new TemplateUniversesAndFactions();
if($universe->numberOfUnivers($id_Author)) {
    include 'sources/universesAndFactions/public/components/addUniverse.php';
}
include 'sources/universesAndFactions/public/components/displayUserUnivers.php';
