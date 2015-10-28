@Grocery = React.createClass
  componentDidMount: ->
    hammer = new Hammer(@getDOMNode())
    hammer.on('swipeleft', @handleSwipeLeftEvent)
    hammer.on('swiperight', @handleSwipeRightEvent)

  getQuantityString: ->
    @quantityToStatus(@props.grocery.quantity)

  quantityToStatus: (quantity) ->
    if quantity == 0
      'out_of_stock'
    else if quantity == 1
      'running_low'
    else
      'in_stock'

  handleSwipeRightEvent: (event) ->
    event.preventDefault()
    @updateQuantity('up')

  handleSwipeLeftEvent: (event) ->
    event.preventDefault()
    @updateQuantity('down')

  updateQuantity: (direction) ->
    cant_go_up = @props.grocery.quantity == 5 and direction == 'up'
    cant_go_down = @props.grocery.quantity == 0 and direction == 'down'
    if cant_go_up or cant_go_down
      return

    $.post(
      '/v1/quantity',
      { grocery: { id: @props.grocery.id, direction: direction}}
    ).done((data) =>
      @props.updateList(
        @getQuantityString(),
        @quantityToStatus(data.quantity),
        @props.grocery,
        data
      )
    )

  render: ->
    React.DOM.div
      className: 'row grocery ' + @getQuantityString()
      React.DOM.li
        className: 'text-center'
        @props.grocery.name

