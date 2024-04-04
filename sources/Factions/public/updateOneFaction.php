<?php
// idNav = 149 
require('sources/Factions/objects/TemplatesFactions.php');
$idFaction = filter($_GET['idFaction']);
echo '<br/>';
echo $idFaction;
$faction = new TemplateFactions ();
$faction->updateFormFaction ($idFaction, $idNav);
echo '<a href="'.findTargetRoute(148).'">Return Admin factions</a>';