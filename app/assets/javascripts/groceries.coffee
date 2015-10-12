# Place all the behaviors and hooks related to the matching controller 
# here. All this logic will automatically be available in application.js. 
# You can use CoffeeScript in this file: http://coffeescript.org/
swipeElementFactory = (element) ->
  hammer = new Hammer(element)
  hammer.on('swiperight', (event) ->
    alert('swiped right!')
  )
  hammer.on('swipeleft', (event) ->
    alert('swiped left!')
  ) 

$(document).on('ready', (event) ->
  groceries = $('#grocery-list')
  groceries.children().each( (item) ->
    swipeElemenrFactory(this)
  )
)
