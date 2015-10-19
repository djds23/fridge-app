@Grocery = React.createClass
  getCssClass: ->
    if @props.grocery.quantity == 0
      'out-of-stock'
    else if @props.grocery.quantity == 1
      'running-low'
    else
      'in-stock'

  componentDidMount: ->
    hammer = new Hammer(@getDOMNode())
    hammer.on('swipeleft', @swipeLeftEvent)
    hammer.on('swiperight', @swipeRightEvent)

  updateQuantity: (direction) ->
    $.post(
      '/v1/quantity',
      {'grocery': { 'gid': @props.quantity.id, 'direction': 'up'}}
    ).done((data) ->
      alert('one down!')
    )

  swipeRightEvent: (event) ->
    updateQuantity('up')

  swipeLeftEvent: (event) ->
    updateQuantity('down')

  render: ->
    React.DOM.div
      className: 'row grocery ' + @getCssClass()
      React.DOM.li
        className: 'text-center'
        @props.grocery.name

