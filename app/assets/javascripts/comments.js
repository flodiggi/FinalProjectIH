
$(document).ready(function(){



$(document).on("click", ".deletecommentbtn", function (e){
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
  $(this).closest('.row').fadeOut(700);
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
