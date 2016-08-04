$(document).ready(function(){
evaluateDateVote()
});



var evaluateDateVote = function() {
  var count = 0
  $('.datevoterow').each(function(){
    if ($(this).find('input:checked').length >= 1) {
      count +=1
    }
    });
    console.log(count)
    var percentage = (count / $('.datevoterow').length) * 100
    var rounded = Math.round(percentage)
    var $ppc = $('.datepiechart')
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

    $('.datepiefill').css('transform','rotate('+ deg +'deg)');
    $('.datepiepercents span').html(rounded+'%');
}
