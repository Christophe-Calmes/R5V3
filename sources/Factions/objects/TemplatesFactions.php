<?php
require('sources/Factions/objects/SQLFactions.php');
Class TemplateFactions extends SQLFactions {
    public function TemplateFormNewFaction () {
        $checkId = new Controles ();
        $id_Author = $checkId->idUser($_SESSION);
        $data = $this->selectUniversOfOneUser($id_Author, 1);
        if(!empty($data)) {
            print_r($data);
        } else {
            echo '<h2 class="subTitleSite">No universe find</h2>';
        }
    }
}