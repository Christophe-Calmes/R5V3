<script type="text/javascript" defer>
  let jeckyl = document.getElementById('magic');
  let magax = document.getElementById('hiddenForm');
  let open = false;
  jeckyl.addEventListener('click', function(){
    if(!open) {
      jeckyl.innerText = "Close form";
      magax.style.display = "block";
      open = true;
    } else {
      jeckyl.innerText = "Open form";
      magax.style.display = "none";
      open = false;
    }
    return open;
  });
</script>
<!--<div>
<button type="button" id="magic" class="open">Ouvrir le formulaire</button>
</div>
<div id="hiddenForm">
<form>
</form>
</div>-->
