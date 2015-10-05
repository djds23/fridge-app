# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('ready', (event) ->

  less_groceries = $('.less')
  more_groceries = $('.more')

  less_groceries.each((index) ->
    less = $(this)
    less.on('click', (event) ->
      gid = less.parent().data('gid')
      associated_quantity_td = $('#' + gid.toString() + '-quantity')
      $.post(
        '/v1/quantity',
        {'grocery': { 'gid': gid, 'direction': 'down'}}
      ).done((data) ->
        new_quantity = data.quantity
        if new_quantity > 0
          associated_quantity_td.html(new_quantity)
        else
          less.parent().hide()    
      )
    )
  )

  more_groceries.each((index) ->
    more = $(this)
    more.on('click', (event) ->
      gid = more.parent().data('gid')
      associated_quantity_td = $('#' + gid.toString() + '-quantity')
      $.post(
        '/v1/quantity',
        {'grocery': { 'gid': gid, 'direction': 'up'}}
      ).done((data) ->
        associated_quantity_td.html(data.quantity)
      )
    )
  )
)

