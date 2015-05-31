// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
  $('#button_options').click(function(){
    var target = $(this).attr('class');
    $('div.'+target).toggle();
  });
});
