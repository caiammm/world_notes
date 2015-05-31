// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(ready);
$(document).on('page:load', ready);

function ready(){
  $('a#button_options').click(function(){
    var target = $(this).attr('class');
    $('div.'+target).toggle();
  });

  $('a#favorite_options').click(function(){
    var target = $(this).attr('class');
    $('div.'+target).toggle();
  });

  $('.folder_options').click(function(){
    var target = $('#new_folder_name');
    target.attr("disabled","disabled");
    target.val('')
  });

  $('.new_folder_options').click(function(){
    var target = $('#new_folder_name');
    target.attr("disabled", false);
    target.val('')
  });


}
