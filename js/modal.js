$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
  });
  $(document).ready(function(){
    Materialize.showStaggeredList('#lstMensajes')
  });

  function abrir(url){
    window.open(url);
  };
  
  