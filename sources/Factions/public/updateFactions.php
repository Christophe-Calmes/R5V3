<?php
require('sources/Factions/objects/TemplatesFactions.php');
echo '<h2 class="subTitleSite">Update your factions</h2>';
$factionsAdmin = new TemplateFactions ();
$factionsAdmin->displayAdminFactionsByUser(1);
$factionsAdmin->displayAdminFactionsByUser(0);
