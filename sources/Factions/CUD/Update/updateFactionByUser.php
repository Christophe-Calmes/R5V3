<?php
// encodeRoutage(69)
require('../sources/Factions/objects/SQLFactions.php');
$controlePostData = array();
array_push($controlePostData, $checkId->controleInteger($_POST['id_Universe']));
array_push($controlePostData, $checkId->controleInteger($_POST['id']));
array_push($controlePostData, sizePost($_POST['name_Factions'], 60));
$checkOwnershipOfUniverse = new  SQLFactions ();
array_push($controlePostData, $checkOwnershipOfUniverse->OwnershipOfUniverse (filter($_POST['id_Universe'])));


$mark = [1, 1, 0, 1];
if($controlePostData == $mark) {
$parametre = new Preparation ();
$param = $parametre->creationPrepIdUser ($_POST);
$checkOwnershipOfUniverse->updateFactionByUser ($param);
    return header('location:../index.php?message=Update problems&idNav='.$idNav.'&idFaction='.filter($_POST['id']));
} else {
    return header('location:../index.php?message=Update problems');
}