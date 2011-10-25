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
  $('.new_target_link:not([disabled=disabled])').live('click', function(event){
    // event.preventDefault(); 
    $(this).addClass("link_processing");
    
    $('.models_select_close_link').trigger('click');

    return false;
  });
  
  $('.delete_target_link').live('click', function(event){
    $(this).prev().removeAttr('disabled');
    $('form').submit();
    return false;
  });

  $('.models_cell').hover( 
    function(event){ 
      $('.new_target_link').css('visibility', 'hidden');     
      $(this).children('.new_target_link').css('visibility', 'visible');
    },
    function(event){ 
      $(this).children('.new_target_link').css('visibility', 'hidden');
    }
  );

  $('.models_select').live('ajaxLoad', function(){
    $(this).selectmenu({style:'popup', width: 220, maxHeight:200, change: function(e, object){$('form').submit();}});
  });

  $('.models_select_close_link').live('click', function(){
    $('.new_target_link').removeAttr('disabled');
    $(this).parents('div').remove();
  });
});
