@GroceryList = React.createClass
  getInitialState: ->
    groceries: @props.groceries

  render: ->
    React.DOM.ol
      className: 'grocery-list'
      for grocery in @state.groceries
        React.createElement Grocery, key: grocery.id, grocery: grocery

