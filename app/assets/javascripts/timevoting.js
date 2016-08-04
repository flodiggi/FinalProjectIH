$(document).ready(function(){
evaluateTimeVote()

});

var evaluateTimeVote = function() {

console.log("test")
var count = 0
$('.timevoterow').each(function(){
  if ($(this).find('input:checked').length >= 1) {
    count +=1
  }
  });
  console.log(count)
  var percentage = (count / $('.timevoterow').length) * 100
  var rounded = Math.round(percentage)
  var $ppc = $('.timepiechart')
  // $ppc.attr("data-percent", percentage)
  // var $ppc = $('.datepiechart'),
  // percent = parseInt($ppc.data('percent')),
  deg = 360*percentage/100;
  if (percentage > 50) {
    $ppc.addClass('gt-50');
  }
  if (percentage < 50) {
    $ppc.removeClass('gt-50');
  }
  $('.timepiefill').css('transform','rotate('+ deg +'deg)');
  $('.timepiepercents span').html(rounded+'%');
}
