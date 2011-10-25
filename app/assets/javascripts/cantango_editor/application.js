// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

  // Fetch Models select dialog
  $('.new_target_link:not([disabled=disabled])').live('click', function(event){
    // event.preventDefault(); 
    $(this).addClass("link_processing");
    
    $('.models_select_close_link').trigger('click');

    return false;
  });
 
  // Delete one Model
  $('.delete_target_link').live('click', function(event){
    $(this).prev().removeAttr('disabled');
    $('form').submit();
    return false;
  });

  // Hovers events for table cells
  $('.models_cell').live('mouseenter', function(event){
    $('.new_target_link').css('visibility', 'hidden');     
    $(this).children('.new_target_link').css('visibility', 'visible');
  });

  $('.models_cell').live('mouseleave', function(event){ 
    $(this).children('.new_target_link').css('visibility', 'hidden');
  });
  
  // Enable selectmenu() on <select>
  $('.models_select').live('ajaxLoad', function(){
    $(this).selectmenu({style:'popup', width: 220, maxHeight:200, change: function(e, object){$('form').submit();}});
  });

  // Closes Models select dialog
  $('.models_select_close_link').live('click', function(){
    $('.new_target_link').removeAttr('disabled');
    $(this).parents('div').remove();
  });
});
