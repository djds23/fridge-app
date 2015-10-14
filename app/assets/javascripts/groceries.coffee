# Place all the behaviors and hooks related to the matching controller 
# here. All this logic will automatically be available in application.js. 
# You can use CoffeeScript in this file: http://coffeescript.org/
swipeElementFactory = (element) ->
  hammer = new Hammer(element)
  hammer.on('swiperight', (event) ->
    $.post(
      '/v1/quantity',
      {'grocery': {'gid': element.dataset.gid, 'direction': 'up'}}
    ).done((data) ->
      alert('one up!')
    ) 
  )
  hammer.on('swipeleft', (event) ->
    $.post(
      '/v1/quantity',
      {'grocery': { 'gid': element.dataset.gid, 'direction': 'down'}}
    ).done((data) ->
      alert('one down!')
    )
  ) 

$(document).on('ready', (event) ->
  groceries = $('#grocery-list')
  groceries.children().each( (item) ->
    swipeElementFactory(this)
  )
)
