@GroceryList = React.createClass
  getInitialState: ->
    in_stock: @props.in_stock
    running_low: @props.running_low
    out_of_stock: @props.out_of_stock

  render: ->
    React.DOM.ol
      className: 'grocery-list'
      for grocery in @state.in_stock
        React.createElement Grocery, key: grocery.id, grocery: grocery, updateList: @prepNewState
      for grocery in @state.running_low
        React.createElement Grocery, key: grocery.id, grocery: grocery, updateList: @prepNewState
      for grocery in @state.out_of_stock
        React.createElement Grocery, key: grocery.id, grocery: grocery, updateList: @prepNewState

  prepNewState: (old_status, new_status, old_grocery, new_grocery) ->
    cleaned_array = _.filter(@state[old_status], (element) =>
      element.id != old_grocery.id
    )

    new_array = @state[new_status].slice()
    new_array.push(new_grocery)
    compare = (a, b) ->
      b.id - a.id

    new_object = {}
    new_object[old_status] = cleaned_array.sort(compare)
    new_object[new_status] = new_array.sort(compare)
    new_object

    @setState(new_object)
 
