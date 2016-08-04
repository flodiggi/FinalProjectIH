
$(document).ready(function(){



$(document).on("submit", ".postcommentform", function (e){
  console.log($('#new_comment').serialize())
e.preventDefault()
  $.ajax({
      type: "POST",
      url: "/comments",
      data: $('#new_comment').serialize(),

      success: function (response) {
        console.log("success")
        $('.commentcontainer').html(response);
        return false;

      }
  })
})

$(document).on("submit", "#deletecomment", function (e){
  $(this).closest('.commentsection').fadeOut(400);
  id = $(this).closest('.rightpanelheader').find('form').data('commtid')
  console.log(id)
e.preventDefault()
  $.ajax({
      type: "POST",
      url: '/comments/'+ id + '/delete',
      data: $(this).closest('.rightpanelheader').find('form').serialize(),

      success: function (response) {
        console.log(response)
        $('.commentcontainer').html(response);

      }
  })
})


});
