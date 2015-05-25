# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # tooltips
  $('i.icon').popover 'trigger': 'hover'

  $("a.photo1").click ->
    id = $(this).parent().parent().attr("id");
    $.post '/update_photo_1/' + id, (data) ->
      photo1 = $("tr#"+id).children("td#photo1");
      photo2 = $("tr#"+id).children("td#photo2");
      text1 = $("tr#"+id).children("td#text1");
      text2 = $("tr#"+id).children("td#text2");
      photo1.html(data.message)

      if photo2.children("a").hasClass('available')
        photo2.removeClass("available");
        photo2.addClass("unavailable");
        photo2.html('<i class="fa fa-times"></i>');

      if text1.children("a").hasClass('available')
        text1.removeClass("available");
        text1.addClass("unavailable");
        text1.html('<i class="fa fa-times"></i>');

      if text2.children("a").hasClass('available')
        text2.removeClass("available");
        text2.addClass("unavailable");
        text2.html('<i class="fa fa-times"></i>');

  $("a.photo2").click ->
    id = $(this).parent().parent().attr("id");
    $.post '/update_photo_2/' + id, (data) ->
      photo1 = $("tr#"+id).children("td#photo1");
      photo2 = $("tr#"+id).children("td#photo2");
      text1 = $("tr#"+id).children("td#text1");
      text2 = $("tr#"+id).children("td#text2");
      photo2.html(data.message)

      if photo1.children("a").hasClass('available')
        photo1.removeClass("available");
        photo1.addClass("unavailable");
        photo1.html('<i class="fa fa-times"></i>');

      if text1.children("a").hasClass('available')
        text1.removeClass("available");
        text1.addClass("unavailable");
        text1.html('<i class="fa fa-times"></i>');

      if text2.children("a").hasClass('available')
        text2.removeClass("available");
        text2.addClass("unavailable");
        text2.html('<i class="fa fa-times"></i>');

  $("a.text1").click ->
    id = $(this).parent().parent().attr("id");
    $.post '/update_text_1/' + id, (data) ->
      photo1 = $("tr#"+id).children("td#photo1");
      photo2 = $("tr#"+id).children("td#photo2");
      text1 = $("tr#"+id).children("td#text1");
      text2 = $("tr#"+id).children("td#text2");
      photo2.html(data.message)

    if photo1.children("a").hasClass('available')
      photo1.removeClass("available");
      photo1.addClass("unavailable");
      photo1.html('<i class="fa fa-times"></i>');

    if photo2.children("a").hasClass('available')
      photo2.removeClass("available");
      photo2.addClass("unavailable");
      photo2.html('<i class="fa fa-times"></i>');

    if text2.children("a").hasClass('available')
      text2.removeClass("available");
      text2.addClass("unavailable");
      text2.html('<i class="fa fa-times"></i>');
