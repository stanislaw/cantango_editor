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
  $('.new_target_link').live('click', function(event){
    // event.preventDefault(); 
    $(this).addClass("link_processing");
    return false;
  });
  
  $('.delete_target_link').live('click', function(event){
    $(this).prev().removeAttr('disabled');
    return false;
  });

  $('.models_select').live('ajaxLoad', function(){
    $(this).selectmenu({style:'popup', width: 220, maxHeight:200});
  });
});
