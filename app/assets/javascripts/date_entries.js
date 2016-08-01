$(document).ready(function(){
  console.log("test")

  var count = 0
  $('.datevoterow').each(function(){
    if ($('.datevoterow input:checked').length <= 1) {
      count +=1
    }
    });
    var percentage = (count / $('.datevoterow').length) * 100
    $('.progress-pie-chart').setAttribute("data-percent", percentage)


});
