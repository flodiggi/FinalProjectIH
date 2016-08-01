$(document).ready(function(){
  console.log("test")

  var count = 0
  $('.timevoterow').each(function(){
    if ($(this).find('input:checked').length >= 1) {
      count +=1
    }
    });
    console.log(count)
    var percentage = (count / $('.timevoterow').length) * 100
    $('.timepiechart').attr("data-percent", percentage)

    $(function(){
      var $ppc = $('.timepiechart'),
        percent = parseInt($ppc.data('percent')),
        deg = 360*percent/100;
      if (percent > 50) {
        $ppc.addClass('gt-50');
      }
      $('.timepiefill').css('transform','rotate('+ deg +'deg)');
      $('.timepiepercents span').html(percent+'%');
    });


});
