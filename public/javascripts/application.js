// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    
    //
    $( "#modalForm" ).button().click(function() {$( "#dialog-form" ).dialog( "open");});
    $('.info').tipsy({gravity: 'w'});
    $(".trigger").click(function(){
      $("#panel").toggle("fast");
      $(this).toggleClass("active");
      return false;
    });

    $("a.fancybox").fancybox({
      zoomSpeedIn: 300,
      zoomSpeedOut: 300,
      overlayShow:true
    });
    $(function() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
      $( "#dialog:ui-dialog" ).dialog( "close" );
			$( "#dialog-modal" ).dialog({
    		height: 140,
      	modal: true
      });
    });
    
    $(function() {
      $( "#sortable" ).sortable({placeholder: "ui-state-highlight"});
      $( "#sortable" ).disableSelection();
    });
    $(function() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
      $( "#dialog:ui-dialog" ).dialog( "close" );
      $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 460,
        width: 450
      });
    });
    countWord();
});

function countWord(){
    $('.word_count').each(function(){
      var length = $(this).val().length;
      $(this).parent().find('.counter').html( length + ' caracteres');
      $(this).keyup(function(){
        var new_length = $(this).val().length;
        $(this).parent().find('.counter').html( new_length + ' caracteres');
      });
    });
}
function hideFlash() {
  var flash_div = $(".flash");
  setTimeout(function() { flash_div.fadeOut(2000, function() { flash_div.html(""); flash_div.hide(); })}, 2500);
}

