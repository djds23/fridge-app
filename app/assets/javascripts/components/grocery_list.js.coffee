@GroceryList = React.createClass
  getInitialState: ->
    in_stock: @props.in_stock
    running_low: @props.running_low
    out_of_stock: @props.out_of_stock

  render: ->
    React.DOM.ol
      className: 'grocery-list'
      for grocery in @state.in_stock
        React.createElement Grocery, key: grocery.id, grocery: grocery
      for grocery in @state.running_low
        React.createElement Grocery, key: grocery.id, grocery: grocery
      for grocery in @state.out_of_stock
        React.createElement Grocery, key: grocery.id, grocery: grocery

