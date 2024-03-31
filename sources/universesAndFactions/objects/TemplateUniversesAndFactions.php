<?php
require('sources/universesAndFactions/objects/SQLuniversesAndFactions.php');
Class TemplateUniversesAndFactions extends SQLuniversesAndFactions {
    public function displayUniversOfConnectedUser ($id_Author) {
        $data = $this->selectUniversOfOneUser($id_Author);
        print_r($data);
    }
}