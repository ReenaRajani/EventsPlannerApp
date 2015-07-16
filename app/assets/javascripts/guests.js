$(document).ready(function(){
  
  var toCopyHTML = $('div.to_copy').html();
  $('body').on("click",'p.add_new_guest', function(e){

    var toAppend = $('<div>').addClass('to_copy').html(toCopyHTML);
    $('.to_copy:last').after(toAppend);

  });

  $('.send_invites'). on('submit', function(event) {
    event.preventDefault();
    // debugger;

    var details = [];
    $("input[type=checkbox]:checked").each( function (i, input) { 
      var data = {};
      data.name = $(input).data("name");
      data.email = $(input).data("email");
      details.push( data );
    });
    // console.log( details );

    $.ajax({
      url: window.location.pathname + "/mail",
      data: {
        details: JSON.stringify( details )
      },
      method: "POST",
      success: function (data) {
        console.log( data );
      },
      error: function (data) {
        console.log( data );
      }
    })


  });

});