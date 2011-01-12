// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    $('#loading').fadeOut();
//    $('.show_comments').live('load',function(e){
    $('a.show_comments').live('click',function(e){

        $(this).parent().next('.comment_index').slideToggle();

    });

    $("#full_text_search_form")
      .bind('ajax:loading', function() {
            //$('#loading').fadeIn();
            $("#notas").hide();
            $("#in_comments").hide();

            $("#notas").block();
        })
      //.bind('ajax:success', function(data, status, xhr) {alert("success!");})
      //.bind('ajax:failure', function(xhr, status, error) {alert("failure!");})
      .bind('ajax:complete', function() {
            $("#notas").unblock();;
            $("#notas").fadeIn('slow');
            $("#in_comments").fadeIn('slow');

        });

/*    $('#search_buttom').live('click',function(e){

        $("#notas").html($('#loading').html());

    });
*/
/*
    $('.show_comments').click(
        function (){
            $('#comment_index').slideToggle();
            return false;
    });
*/

    $('.info').tipsy({gravity: 's'});
    $('.info2').tipsy({gravity: 'w'});
    $(".trigger").click(function(){
      $("#panel").toggle("fast");
      $(this).toggleClass("active");
      return false;
    });

    /*$("a.fancybox").fancybox({
      zoomSpeedIn: 300,
      zoomSpeedOut: 300,
      overlayShow:true
    });*/
    /*$(function() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
     $( "#dialog:ui-dialog" ).dialog( "close" );
    $( "#dialog-modal" ).dialog({
    		height: 140,
      	modal: true
      });
    });
    */
   $(function() {
     $( "#sortable" ).sortable({placeholder: "ui-state-highlight"});
     $( "#sortable" ).disableSelection();
    });
   $(function() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
     $( "#dialog:ui-dialog" ).dialog( "close" );
     $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 600,
        width: 650,
  			modal: true,
        close: function() {
         $('form input[type*=text], form select').val(" ");
         $('#nota_body_ifr').contents().filter(function() {
            this.body.children[0].childNodes[0].nodeValue = "";
        });
			}
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

