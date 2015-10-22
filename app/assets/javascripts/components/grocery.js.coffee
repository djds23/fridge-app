@Grocery = React.createClass
  componentDidMount: ->
    hammer = new Hammer(@getDOMNode())
    hammer.on('swipeleft', @swipeLeftEvent)
    hammer.on('swiperight', @swipeRightEvent)

  getQuantityString: ->
    @quantityToStatus(@props.grocery.quantity)

  quantityToStatus: (quantity) ->
    if quantity == 0
      'out_of_stock'
    else if quantity == 1
      'running_low'
    else
      'in_stock'

  swipeRightEvent: (event) ->
    event.preventDefault()
    @updateQuantity('up')

  swipeLeftEvent: (event) ->
    event.preventDefault()
    @updateQuantity('down')

  updateQuantity: (direction) ->
    $.post(
      '/v1/quantity',
      {'grocery': { 'gid': @props.grocery.id, 'direction': direction}}
    ).done((data) =>
      if @props.grocery.quantity == data.quantity
        return null

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

