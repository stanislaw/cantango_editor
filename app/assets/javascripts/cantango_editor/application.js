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
  $('.models_cell').live('mouseenter', function(){
    timeou = setTimeout(function(target){
      $(target).children('.sexy_buttons').css('opacity', '1');
      //$(this).children('.sexy_buttons').css('visibility', 'visible')
    }, 150, this);
  }).live('mouseleave', function(){ 
    clearTimeout(timeou);
    $(this).children('.sexy_buttons').css('opacity', '0.3');
    //$('.sexy_buttons').css('visibility', 'hidden');     
  });
  
  // Enable selectmenu() on <select>
  $('.models_select').live('ajaxLoad', function(){
    $(this).selectmenu({style:'popup', width: 220, maxHeight:200, change: function(e, object){$('form').submit();}});
  });

  // Closes Models select dialog
  $('.models_select_close_link').live('click', function(){
    $('.new_target_link').removeAttr('disabled');
    $('.models_select_block').remove();
    return false;
  });
  
  $('.permission_group_section').collapse();

  $('.models_line').live('mouseenter', function(){
    $(this).children('.delete_target_section').show(); 
  }).live('mouseleave',function(){
    $(this).children('.delete_target_section').hide();   
  });
});
