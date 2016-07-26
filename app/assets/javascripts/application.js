// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .





// $(document).ready(function(){
//
//   $("#dateform").submit(function(e) {
//     $.ajax({
//         type: "POST",
//         url: "/data_entries"),
//         data: ,
//         dataType: "JSON"
//     }).success(function(json){
//         console.log("success", json);
//     })
//     e.preventDefault()
//   });
// })

$(document).ready(function(){
  $(document).on("submit", "#dateform", function (e){
    console.log($('#dateform').serialize())
  e.preventDefault()
    $.ajax({
        type: "POST",
        url: "/date_entries",
        data: $('#dateform').serialize(),

        success: function (response) {
          console.log("success")
          $('.datecontent').replaceWith(response)
        }
    })
  })

})



// $(document).on "submit", "#new_comment", (e) ->
//   e.preventDefault()
//   $form = $ this
//
//   $.post "#{$form.attr 'action'}.json", $form.serializeArray(), (comment) ->
//     $text = $('<span>').date comment.date
//     $createdAt = $('<span>').text comment.created_at
//     $newComment = $('<div class="comment">').append($text).append $createdAt
//     $('.comment:last').after $newComment
