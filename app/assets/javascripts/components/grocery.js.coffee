@Grocery = React.createClass
  getQuantityString: ->
    @quantityToStatus(@props.grocery.quantity)

  componentDidMount: ->
    hammer = new Hammer(@getDOMNode())
    hammer.on('swipeleft', @swipeLeftEvent)
    hammer.on('swiperight', @swipeRightEvent)

  updateQuantity: (direction) ->
    $.post(
      '/v1/quantity',
      {'grocery': { 'gid': @props.grocery.id, 'direction': direction}}
    ).done((data) ->
      alert('one ' + direction + '!')
      new_state = @prepNewState(
        @getQuantityString(),
        @quantityToStatus(data.quantity),
        data
      )
      @setState(new_state)
    )

  prepNewState: (old_status, new_status, new_grocery) ->
    cleaned_array = _.remove(old_array, (element) ->
      element == @props.grocery
    )
    new_array.push(new_grocery)
    new_object = {}
    new_object[old_status] = cleaned_array
    new_object[new_status] = new_array
    new_object
    

  swipeRightEvent: (event) ->
    event.preventDefault()
    @updateQuantity('up')

  swipeLeftEvent: (event) ->
    event.preventDefault()
    @updateQuantity('down')

  quantityToStatus: (quantity) ->
    if quantity == 0
      'out_of_stock'
    else if quantity == 1
      'running_low'
    else
      'in_stock'

  render: ->
    React.DOM.div
      className: 'row grocery ' + @getQuantityString()
      React.DOM.li
        className: 'text-center'
        @props.grocery.name

