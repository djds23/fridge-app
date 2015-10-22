@GroceryList = React.createClass
  getInitialState: ->
    in_stock: @props.in_stock
    running_low: @props.running_low
    out_of_stock: @props.out_of_stock

  prepNewState: (old_status, new_status, old_grocery, new_grocery) ->
    compare = (a, b) ->
      b.id - a.id

    cleaned_array = _.filter(@state[old_status], (element) ->
      element.id != old_grocery.id
    )

    new_array = @state[new_status].slice()
    new_array.push(new_grocery)

    new_object = {}
    new_object[old_status] = cleaned_array.sort(compare)
    new_object[new_status] = new_array.sort(compare)

    @setState(new_object)
 
  render: ->
    React.DOM.ol
      className: 'grocery-list'
      for grocery in @state.in_stock
        React.addons.CSSTransitionGroup transitionName: 'slider', transitionEnterTimeout: 500, transitionLeaveTimeout: 300
        React.createElement Grocery, key: grocery.id, grocery: grocery, updateList: @prepNewState
      for grocery in @state.running_low
        React.addons.CSSTransitionGroup transitionName: 'slider', transitionEnterTimeout: 500, transitionLeaveTimeout: 300
        React.createElement Grocery, key: grocery.id, grocery: grocery, updateList: @prepNewState
      for grocery in @state.out_of_stock
        React.addons.CSSTransitionGroup transitionName: 'slider', transitionEnterTimeout: 500, transitionLeaveTimeout: 300
        React.createElement Grocery, key: grocery.id, grocery: grocery, updateList: @prepNewState

