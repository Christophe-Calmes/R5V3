<?php
////encodeRoutage(60)
require('../sources/universesAndFactions/objects/SQLuniversesAndFactions.php');
$controlePostData = array();
array_push($controlePostData, $checkId->controleInteger($_POST['NT']));
array_push($controlePostData, sizePost($_POST['name_Univers'], 50));
$mark = [1, 0];

if($mark == $controlePostData) {
    $addUnivers = new SQLuniversesAndFactions();
    $_POST['id_Author'] = $checkId->idUser($_SESSION);
    if($addUnivers->creatUniverses ($_POST)) {
        return header('location:../index.php?message=New registered universe.&idNav='.$idNav);
    } else {
        return header('location:../index.php?message=Limit of creatable universe reached.&idNav='.$idNav);
    }
    
} else {
    return header('location:../index.php?message=Registration problems&idNav='.$idNav);
}
