Grocery = React.createFactory(@Grocery)

@GroceryList = React.createClass
  getInitialState: ->
    list_name: @props.list_name
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
    React.DOM.h1 className: 'text-center', @state.list_name,
    React.DOM.ol
      className: 'grocery-list'
      for grocery in @state.in_stock
        Grocery key: grocery.id, grocery: grocery, updateList: @prepNewState
      for grocery in @state.running_low
        Grocery key: grocery.id, grocery: grocery, updateList: @prepNewState
      for grocery in @state.out_of_stock
        Grocery key: grocery.id, grocery: grocery, updateList: @prepNewState

