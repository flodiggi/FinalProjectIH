$(document).ready(function(){
  console.log("test")

  var count = 0
  $('.locvoterow').each(function(){
    if ($(this).find('input:checked').length >= 1) {
      count +=1
    }
    });
    console.log(count)
    var percentage = (count / $('.locvoterow').length) * 100
    $('.locpiechart').attr("data-percent", percentage)

    $(function(){
      var $ppc = $('.locpiechart'),
        percent = parseInt($ppc.data('percent')),
        deg = 360*percent/100;
      if (percent > 50) {
        $ppc.addClass('gt-50');
      }
      $('.locpiefill').css('transform','rotate('+ deg +'deg)');
      $('.locpiepercents span').html(percent+'%');
    });







});
