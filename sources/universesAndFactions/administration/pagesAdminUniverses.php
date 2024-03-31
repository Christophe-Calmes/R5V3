<?php
  require 'functions/functionPagination.php';
  echo '<section>';
  if(isset($_GET['page']) && (!empty($_GET['page']))) {
    $currentPage = filter($_GET['page']);
  } else {
    $currentPage = 1;
  }
$parPage = 10;
// Déclaration de paramètre vide :
$param = [];
$nbrOfUnivers = $analyse->totalNumberOfUniversDashboard ();
$pages = ceil($nbrOfUnivers/$parPage);
$premier = ($currentPage * $parPage) - $parPage;
$analyse->paginationUnivers ($premier, $parPage, $idNav);
for ($page=1; $page <= $pages ; $page++ ) {
    echo '<a class="lienNav" href="index.php?idNav='.$idNav.'&page='.$page.'">'.$page.'</a>';
  }
  echo '</section>';