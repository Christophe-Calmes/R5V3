
<div>
    <button type="button" id="magic" class="open">Creat a new universe</button>
</div>
<div id="hiddenForm">
    <form class="formulaireClassique" action="<?php echo encodeRoutage(61); ?>" method="post">
    <label for="name_Univers">Name of your new universe</label>
    <input type="text" id="name_Univers" name="name_Univers" placeholder="Name of new universe"/>
    <label for="NT">Technology level</label>
    <input type="number" id="NT"  name="NT" min="1" max="12" value="6" />
    <button type="submit" name="idNav" value="<?=$idNav?>">Creat</button>
    </form>
</div>
<?php
include 'javaScript/magicButtonMenus.php';
?>