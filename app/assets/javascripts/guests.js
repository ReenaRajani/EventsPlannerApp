$(document).ready(function(){
  
  var toCopyHTML = $('div.to_copy').html();
  $("body").on("click","p.add_new_guest", function(e){

    var toAppend = $('<div>').addClass('to_copy').html(toCopyHTML);
    $('.to_copy:last').after(toAppend);

  });


});