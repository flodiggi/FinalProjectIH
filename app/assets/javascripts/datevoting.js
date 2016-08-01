$(document).ready(function(){
  console.log("test")

  var count = 0
  $('.datevoterow').each(function(){
    if ($(this).find('input:checked').length >= 1) {
      count +=1
    }
    });
    console.log(count)
    var percentage = (count / $('.datevoterow').length) * 100
    $('.datepiechart').attr("data-percent", percentage)


  $(function(){
    var $ppc = $('.datepiechart'),
      percent = parseInt($ppc.data('percent')),
      deg = 360*percent/100;
    if (percent > 50) {
      $ppc.addClass('gt-50');
    }
    $('.datepiefill').css('transform','rotate('+ deg +'deg)');
    $('.datepiepercents span').html(percent+'%');
  });


});
