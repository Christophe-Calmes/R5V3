<?php
// encodeRoutage(70)
require('../sources/Factions/objects/SQLFactions.php');
$controlePostData = array();
array_push($controlePostData, $checkId->controleInteger($_POST['id']));
$mark = [1];
if($controlePostData == $mark) {
    $parametre = new Preparation ();
    $param = $parametre->creationPrepIdUser ($_POST);
    $deleteFactionByUser = new  SQLFactions ();
    $deleteFactionByUser->deleteFactionByUser ($param);
    return header('location:../'.findTargetRoute(148).'&message=Delete faction');
} else {
    return header('location:../index.php?message=Delete faction problems');
}


