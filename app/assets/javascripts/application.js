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
          $('.datecontent').html(response);

        }
    })
  })




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


    $(document).on("click", ".votesubmit", function (e){
      

      checkedboxes = []
      uncheckedboxes = []

      $('#userdatevotes input:checked').each(function(){
        checkedboxes.push($(this).val());
        });

      $('#userdatevotes input:not(:checked)').each(function(){
        uncheckedboxes.push($(this).val());
        });

        userid = $('#userdatevotes td')[1].getAttribute("userid")
        actid = $('#userdatevotes td')[1].getAttribute("userid")

    e.preventDefault()
      $.ajax({
          type: "POST",
          url: "/vote",
          data: {userid: userid, actid: actid, checkedboxes: checkedboxes, uncheckedboxes: uncheckedboxes },

          success: function (response) {
            console.log("success")
            console.log(response)

          }
      })
    })





  // $(function(){
  // var numCols = 3;
  // var numRows = 2;
  //   for (var i = 0; i < numRows; i++) {
  //     for (var j = 0; j < numCols; j++){

  // table = $("#mytab1");
  // for (var i = 0, row; row = $(".table").find("tbody").find("td")[0]; i++) {
  //  //iterate through rows
  //  //rows would be accessed using the "row" variable assigned in the for loop
  //  for (var j = 0, col; col = row.cells[j]; j++) {
  //    //iterate through columns
  //    //columns would be accessed using the "col" variable assigned in the for loop
  //     var cell = $("td");
  //       cell.addClass('cell blue');
  //       cell.attr("row", i);
  //       cell.attr("col", j);
  //     }
  //   }
  // })




})
