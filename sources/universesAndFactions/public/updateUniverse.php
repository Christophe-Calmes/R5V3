<?php
//findTargetRoute(146)
require('sources/universesAndFactions/objects/TemplateUniversesAndFactions.php');
$post['id'] = filter($_GET['idUniverse']);
$parametre = new Preparation();
$param = $parametre->creationPrepIdUser ($post);
$universes = new TemplateUniversesAndFactions ();
$universes->updateUniverse ($param, $idNav);