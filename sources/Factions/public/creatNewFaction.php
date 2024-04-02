<?php
require('sources/Factions/objects/TemplatesFactions.php');
$factions = new TemplateFactions ();
$factions->TemplateFormNewFaction ($idNav);
echo '<h2 class="subTitleSite">Factions already available</h2>';
$factions->displayFactionsByUser(1);