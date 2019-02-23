/*
 * auteur: XU Yizhou, JIANG Chunyang
 */
function switchPresentation(id, type){
    var button = document.getElementById("bt_"+id);
    var aBlock = document.getElementById("r_"+id+"_a");
    var bBlock = document.getElementById("r_"+id+"_b");
    
    if ( button.value == 'b' )
    {
        aBlock.style.display = 'none' ;
        bBlock.style.display = 'block' ;
        button.value="a";
        switch(type)
        { 
            case 1:
            button.innerHTML="résultat"; button.className="special icon fa-eye"; break;
            case 2:
            button.innerHTML="image"; button.className="special icon fa-image"; break;
            case 3:
            button.innerHTML="DTD"; button.className="special icon fa-code"; break;
        }
    }
    else
    { 
        bBlock.style.display = 'none' ;
        aBlock.style.display = 'block' ;
        button.value="b";
        switch(type)
        { 
            case 1:
            button.innerHTML="code"; button.className="icon fa-code"; break;
            case 2:
            case 3:
            button.innerHTML="XML"; button.className="icon fa-code"; break;
        }
    }
}

//switchContent
function switchContent(id, src){
    var button = document.getElementById("bt_"+id);
    var frame = document.getElementById(id);
    frame.src=src; 
}




// Accordion
$(document).ready(function(){
  var animTime = 300,
      clickPolice = false;
  
  $(document).on('touchstart click', '.acc-btn', function(){
    if(!clickPolice){
       clickPolice = true;
      
      var currIndex = $(this).index('.acc-btn'),
          targetHeight = $('.acc-content-inner').eq(currIndex).outerHeight();
   
      $('.acc-btn h4').removeClass('selected');
      $(this).find('h4').addClass('selected');
      
      $('.acc-content').stop().animate({ height: 0 }, animTime);
      $('.acc-content').eq(currIndex).stop().animate({ height: targetHeight }, animTime);

      setTimeout(function(){ clickPolice = false; }, animTime);
    }
  });
});


//showResult
function showResult(id){
    var aBlock = document.getElementById("query_result_"+id);
    aBlock.style.height = '20em' ;    
}