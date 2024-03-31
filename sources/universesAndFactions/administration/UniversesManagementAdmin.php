<?php
require('sources/universesAndFactions/objects/TemplateUniversesAndFactions.php');
$analyse = new TemplateUniversesAndFactions();

echo '<div>
<button type="button" id="magic" class="open">Open dashboard universes</button>
</div>
<div id="hiddenForm">'; 
$analyse->dashboardAdminUnivers ();
echo'</div>';
include 'sources/universesAndFactions/administration/pagesAdminUniverses.php';

include 'javaScript/magicButtonMenus.php';