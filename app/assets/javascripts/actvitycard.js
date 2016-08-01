$(document).ready(function(){

  $('.event-container').hover(function(){
        $(this).find('.event-details').fadeToggle(200);
        // $(this).find('.event-overview').fadeToggle(200);
    });



    $(function(){
  var $ppc = $('.progress-pie-chart'),
    percent = parseInt($ppc.data('percent')),
    deg = 360*percent/100;
  if (percent > 50) {
    $ppc.addClass('gt-50');
  }
  $('.ppc-progress-fill').css('transform','rotate('+ deg +'deg)');
  $('.ppc-percents span').html(percent+'%');
});

});
