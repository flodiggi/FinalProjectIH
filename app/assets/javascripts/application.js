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
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .



$(document).ready(function(){



  // datevoting:

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



    $(document).on("click", ".votesubmitdate", function (e){

      checkedboxes = []
      uncheckedboxes = []

      $('#userdatevotes input:checked').each(function(){
        checkedboxes.push($(this).val());
        });

      $('#userdatevotes input[type=checkbox]:not(:checked)').each(function(){
        uncheckedboxes.push($(this).val());
        });

        userid = $('#userdatevotes td')[1].getAttribute("userid")
        actid = $('#userdatevotes td')[1].getAttribute("actid")

    e.preventDefault()
      $.ajax({
          type: "POST",
          url: "/votedate",
          data: {userid: userid, actid: actid, checkedboxes: checkedboxes, uncheckedboxes: uncheckedboxes },

          success: function (response) {
            console.log("success")
            console.log(response)
            $('.datecontent').html(response);
            evaluateDateVote();

          }
      })
    })




    // timevoting
    $(document).on("submit", "#timeform", function (e){
      console.log($('#timeform').serialize())
    e.preventDefault()
      $.ajax({
          type: "POST",
          url: "/time_entries",
          data: $('#timeform').serialize(),

          success: function (response) {
            console.log("success")
            $('.timecontent').html(response);

          }
      })
    })


      $(document).on("click", ".votesubmittime", function (e){

        checkedboxes = []
        uncheckedboxes = []

        $('#usertimevotes input:checked').each(function(){
          checkedboxes.push($(this).val());
          });

        $('#usertimevotes input[type=checkbox]:not(:checked)').each(function(){
          uncheckedboxes.push($(this).val());
          });

          userid = $('#usertimevotes td')[1].getAttribute("userid")
          actid = $('#usertimevotes td')[1].getAttribute("actid")

      e.preventDefault()
        $.ajax({
            type: "POST",
            url: "/votetime",
            data: {userid: userid, actid: actid, checkedboxes: checkedboxes, uncheckedboxes: uncheckedboxes },

            success: function (response) {
              console.log("success")
              console.log(response)
              $('.timecontent').html(response);
              evaluateTimeVote();


            }
        })
      })


      // locationvoting
      $(document).on("submit", "#locationform", function (e){
        console.log($('#locationform').serialize())
      e.preventDefault()
        $.ajax({
            type: "POST",
            url: "/location_entries",
            data: $('#locationform').serialize(),

            success: function (response) {
              console.log("success")
              $('.locationcontent').html(response);

            }
        })
      })


        $(document).on("click", ".votesubmitlocation", function (e){

          checkedboxes = []
          uncheckedboxes = []

          $('#userlocationvotes input:checked').each(function(){
            checkedboxes.push($(this).val());
            });

          $('#userlocationvotes input[type=checkbox]:not(:checked)').each(function(){
            uncheckedboxes.push($(this).val());
            });

            userid = $('#userlocationvotes td')[1].getAttribute("userid")
            actid = $('#userlocationvotes td')[1].getAttribute("actid")

        e.preventDefault()
          $.ajax({
              type: "POST",
              url: "/votelocation",
              data: {userid: userid, actid: actid, checkedboxes: checkedboxes, uncheckedboxes: uncheckedboxes },

              success: function (response) {
                console.log("success")
                console.log(response)
                $('.locationcontent').html(response);
                evaluateLocVote();


              }
          })
        })








    $(document).on("submit", "#deleteactivity", function (e){
      id = $(this).closest('.actcontainer').find('form').data('actid')
      $(this).closest('.actcontainer').fadeOut();

      console.log(id)
    e.preventDefault()
      $.ajax({
          type: "POST",
          url: '/activity/'+ id + '/delete',
          data: $(this).closest('.actcontainer').find('form').serialize(),

          success: function (response) {
            console.log(response)
            $('.activitycontainer').html(response);

          }
      })
    })



    // $(document).on("submit", "#makehost", function (e){
    //   $(this).closest('.actcontainer').fadeOut();
    //   id = $('#makehost').attr('userid')
    //   console.log(id);
    //   console.log($('#makehost').serialize())
    // e.preventDefault()
    //   $.ajax({
    //       type: "POST",
    //       url: '/hosts',
    //       data: $('#makehost').serialize(),
    //
    //       success: function (response) {
    //         console.log(response)
    //       }
    //   })
    // })



    // $(".allowvotinglocation").click(function() {
    //   console.log($(this))
    // if($(this).is(":checked")) {
    //   console.log("it is checked")
    //     $("#buttonloc").show(300);
    // } else {
    //   console.log("it is not checked")
    //     $("#buttonloc").hide(200);
    // }
    // });

    $(document).on("click", ".copylink", function (){
      var text = window.location.href
      window.prompt("Send this link to your friends, together with the access keyword", text);

    })












})
