# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
less_groceries = $('.less')
more_groceries = $('.more')

less_groceries.each((index) ->
  less = $(this) 
  less.on('click', (event) -> 
    gid = less.parent().data('gid')
    $.post(
      '/groceries/quantity',
      { 'gid': gid, 'direction': 'down'}
    ).done((data) ->
      alert('one down!')
    )
  )
)

more_groceries.each((index) ->
  more = $(this) 
  more.on('click', (event) -> 
    gid = more.parent().data('gid')
    $.post(
      '/groceries/quantity',
      { 'gid': gid, 'direction': 'up'}
    ).done((data) ->
      alert('one up!')
    )
  )
)
