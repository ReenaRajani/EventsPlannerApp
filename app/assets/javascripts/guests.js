$(document).ready(function(){
    

    //Drop down date and time picker

    $(function(){
      $('.datepicker').datepicker({
        dateFormat: 'dd-mm-yy',
        onSelect: function(datetext){
        var d = new Date(); // for now
        datetext= datetext+" "+d.getHours()+": "+d.getMinutes()+": "+d.getSeconds();
        $('.datepicker').val(datetext);
    }
      });

    });

    

    // $('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});

   $(".dropdown-toggle").dropdown(); // to display the drop down menu in the pages
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