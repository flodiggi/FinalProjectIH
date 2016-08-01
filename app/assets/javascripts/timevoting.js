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
    $('.progress-pie-chart .timepie').attr("data-percent", percentage)

    $(function(){
      var $ppc = $('.progress-pie-chart .timepie'),
    percent = parseInt($ppc.data('percent')),
    deg = 360 * percentage/100;
    if (percent > 50) {
    $ppc.addClass('gt-50');
  }
  $('.ppc-progress-fill .timepie').css('transform','rotate('+ deg +'deg)');
  $('.ppc-percents .timepie span').html(percent+'%');
});


});
