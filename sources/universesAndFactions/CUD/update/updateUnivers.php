<?php
// encodeRoutage(62)
require('../sources/universesAndFactions/objects/SQLuniversesAndFactions.php');
$controlePostData = array();
array_push($controlePostData, $checkId->controleInteger($_POST['id']));
if($controlePostData == [1]) {
    $updateUniverse = new SQLuniversesAndFactions();
    $parametre = new Preparation ();
    $param = $parametre->creationPrepIdUser ($_POST);
    $updateUniverse->updateValidStatusUniverse ($param);
    return header('location:../index.php?message=Universe update&idNav='.$idNav);
} else {
    return header('location:../index.php?message=Error&idNav='.$idNav);
}