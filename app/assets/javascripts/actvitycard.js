$(document).ready(function(){

  $('.event-container').hover(function(){
        $(this).find('.event-details').fadeToggle(200);
        // $(this).find('.event-overview').fadeToggle(200);
    });

});
