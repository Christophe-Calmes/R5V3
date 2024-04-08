<?php
 require ('functions/functionPagination.php');
 require ('sources/Factions/objects/TemplatesFactions.php');
 $adminFactions = new TemplateFactions();
 $valide = 1;
 require 'modules/users/objets/getUser.php';
 require 'modules/users/objets/printUser.php';
 $users = new PrintUser();
 if(isset($_GET['page']) && (!empty($_GET['page']))) {
   $currentPage = filter($_GET['page']);
 } else {
   $currentPage = 1;
 }
   $parPage = 10;
   echo '<h3>Liste des utilisateurs | page : '.$currentPage.'</h3>';
   // Nombre d'utilisateurs + Nombre de pages
    $nbr = $users->countUserMembres ();
   $nbrArticles = $nbr[0]['nbr'];
   $pages = ceil($nbrArticles/$parPage);
   $premier = ($currentPage * $parPage) - $parPage;
   // Element d'affichage renseignement utilisateurs.
    $dataUsers = $users->getUserMemberPage($premier, $parPage);
    echo '<ul class="listClass">';
    foreach($dataUsers as $value) {
        echo '<li><a class="link" href="'.findTargetRoute(152).'">'.$value['login'].' administers these factions</a></li>';
    }
    echo '</ul>';
   // Fin affichage
   for ($page=1; $page <= $pages ; $page++ ) {
     echo '<a class="lienNav" href="index.php?idNav='.$idNav.'&page='.$page.'">'.$page.'</a>';
   }
