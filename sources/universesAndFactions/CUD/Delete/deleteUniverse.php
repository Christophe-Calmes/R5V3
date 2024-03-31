<?php 
//  encodeRoutage(63)
require('../sources/universesAndFactions/objects/SQLuniversesAndFactions.php');
$controlePostData = array();
array_push($controlePostData, $checkId->controleInteger($_POST['id']));
if($controlePostData == [1]) {
    $deleteUniverse = new SQLuniversesAndFactions();
    $parametre = new Preparation ();
    $param = $parametre->creationPrepIdUser ($_POST);
    $deleteUniverse->deleteInvalidStatusUniverse ($param);
    return header('location:../index.php?message=Universe delete&idNav='.$idNav);
} else {
    return header('location:../index.php?message=Error&idNav='.$idNav);
}