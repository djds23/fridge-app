@Grocery = React.createClass
  getCssClass: ->
    if @props.grocery.quantity == 0
      'out-of-stock'
    else if @props.grocery.quantity == 1
      'running-low'
    else
      'in-stock'

  render: ->
    React.DOM.div
      className: 'row grocery ' + @getCssClass()
      React.DOM.li
        className: 'text-center'
        @props.grocery.name

