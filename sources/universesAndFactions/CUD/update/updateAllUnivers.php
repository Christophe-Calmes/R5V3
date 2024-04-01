<?php
// encodeRoutage(67)
require('../sources/universesAndFactions/objects/SQLuniversesAndFactions.php');
$controlePostData = array();
array_push($controlePostData, $checkId->controleInteger($_POST['idUniverse']));
array_push($controlePostData, $checkId->controleInteger($_POST['NT']));
array_push($controlePostData, sizePost($_POST['name_Univers'], 50));
$mark = [1, 1, 0];
if($controlePostData == $mark) {
    $parametre = new Preparation();
    $param = $parametre->creationPrepIdUser ($_POST);
    $universe = new SQLuniversesAndFactions ();
    $universe->updateFileUniverse ($param);
    return header('location:../index.php?message=Universe update&idNav='.$idNav.'&idUniverse='.filter($_POST['idUniverse']));
} else {
    return header('location:../index.php?message=Error&idNav='.$idNav);
}