<?php 
require('sources/universesAndFactions/objects/TemplateUniversesAndFactions.php');
?>
<div>
    <button type="button" id="magic" class="open">Creat a new universe</button>
</div>
<div id="hiddenForm">
    <form class="formulaireClassique" action="<?php encodeRoutage(60) ?>">
    <label for="name_Univers">Name of your new universe</label>
    <input type="text" id="name_Univers" name="name_Univers" required/>
    <label for="NT">Technology level</label>
    <input type="number" id="NT"  name="NT" min="1" max="12"/>
    <button type="submit" name="idNav" value="<?=$idNav?>">Creat</button>
    </form>
</div>
<?php
//encodeRoutage(60)
include 'javaScript/magicButton.php';
?>