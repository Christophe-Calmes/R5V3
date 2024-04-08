<?php
  $valide = 0;
  require 'modules/users/objets/getUser.php';
  require 'modules/users/objets/printUser.php';
  include 'functions/functionPagination.php';
  include 'functions/functionDateTime.php';
  $users = new PrintUser();
if(isset($_GET['page']) && (!empty($_GET['page']))) {
  $currentPage = filter($_GET['page']);
} else {
$currentPage = 1;
}
$parPage = 5;
echo '<h3>Liste des utilisateurs | page : '.$currentPage.'</h3>';
// Nombre d'utilisateurs + Nombre de pages
$nbr = $users->countUserAdmin ($valide);
$nbrArticles = $nbr[0]['nbr'];
$pages = ceil($nbrArticles/$parPage);
$premier = ($currentPage * $parPage) - $parPage;
// Element d'affichage renseignement utilisateurs.
  $dataUsers = $users->getUserCurrentPage($premier, $parPage, $valide);
// Affichage
  $users->userTable($dataUsers, $idNav);
// Fin affichage
for ($page=1; $page <= $pages ; $page++ ) {
  echo '<a class="lienNav" href="index.php?idNav='.$idNav.'&page='.$page.'">'.$page.'</a>';
}
