# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("a.photo1").click ->
    id = $(this).parent().parent().attr("id");
    $.post '/update_photo_1/' + id, (data) ->      
      $(this).html(data.message);

    $(this).removeClass("available");

    $("a.photo2").removeClass("available");
    $("a.photo2").addClass("unavailable");
    $(this).parent().next().html('<i class="fa fa-times"></i>');
