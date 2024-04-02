<?php
// encodeRoutage(68)
require('../sources/Factions/objects/SQLFactions.php');
$controlePostData = array();
array_push($controlePostData, $checkId->controleInteger($_POST['id_Universe']));
array_push($controlePostData, sizePost($_POST['name_Factions'], 60));
$checkOwnershipOfUniverse = new  SQLFactions ();
array_push($controlePostData, $checkOwnershipOfUniverse->OwnershipOfUniverse (filter($_POST['id_Universe'])));
$mark = [1, 0, 1];
if($controlePostData == $mark) {
    $parametre = new Preparation ();
    $param = $parametre->creationPrepIdUser($_POST);
    if($checkOwnershipOfUniverse->insertNewFaction ($param)) {
        return header('location:../index.php?message=Registration faction sucess&idNav='.$idNav);
    } else {
       return header('location:../index.php?message=Limit on the number of factions in a universe reached&idNav='.$idNav);
    }
    
} else {
    return header('location:../index.php?message=Registration problems&idNav='.$idNav);
}

