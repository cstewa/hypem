# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $.ajax
    url: 'hypem/popular'
    dataType: 'json'
    success: (data) ->
     appendPopularToView(data)

  appendPopularToView = (data) ->
    for song in data
      do ->
        addSongData song.title
        addSongData song.artist
        addSongData song.blog
        addSongIFrame song.post_url

        $('#left_screen').append '<br> <br>'

  addSongData = (data) ->
    $('#left_screen').append data + '<br>'

  addSongIFrame = (url) ->
    $('#left_screen').append "<iframe width='100%' src=#{url}> </iframe>"


