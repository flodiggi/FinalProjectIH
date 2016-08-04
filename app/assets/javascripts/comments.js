
$(document).ready(function(){



$(document).on("submit", "#new_comment", function (e){
  console.log($('#new_comment').serialize())
e.preventDefault()
  $.ajax({
      type: "POST",
      url: "/comments",
      data: $('#new_comment').serialize(),

      success: function (response) {
        console.log("success")
        $('.commentcontainer').html(response);

      }
  })
})

$(document).on("submit", "#deletecomment", function (e){
  $(this).closest('.commentsection').fadeOut(400);
  var id = $(this).closest('.rightpanelheader').find('form').data('commtid')
e.preventDefault()
  $.ajax({
      type: "POST",
      url: '/comments/'+ id + '/delete',
      data: $(this).closest('.rightpanelheader').find('form').serialize(),

      success: function (response) {
        $('.commentcontainer').html(response);

      }
  })
})


  setTimeout(function () {
    $('.flash-message').fadeOut()


  },2000)





});
