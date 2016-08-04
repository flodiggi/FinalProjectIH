$(document).ready(function(){
evaluateLocVote()
});





var evaluateLocVote = function() {

var count = 0
$('.locvoterow').each(function(){
  if ($(this).find('input:checked').length >= 1) {
    count +=1
  }
  });
  console.log(count)
  var percentage = (count / $('.locvoterow').length) * 100
  var rounded = Math.round(percentage)
  var $ppc = $('.locpiechart')
  // var $ppc = $('.datepiechart'),
  // percent = parseInt($ppc.data('percent')),
  deg = 360*percentage/100;
  if (percentage > 50) {
    $ppc.addClass('gt-50');
  }
  if (percentage < 50) {
    $ppc.removeClass('gt-50');
  }
  $('.locpiefill').css('transform','rotate('+ deg +'deg)');
  $('.locpiepercents span').html(rounded+'%');
}
