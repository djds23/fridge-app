@SingleGrocery = React.createClass
  getInitialState: ->
    grocery: @props.grocery

  updatePurchasedAt: ->
    $.post(
      '/v1/purchased_at',
      { grocery: { id: @state.grocery.id }}
    ).done((data) =>
      @setState(grocery: data)
    )

  # This method is not the best way to do this.
  # The problem here is we do not get rails notices.
  deleteGrocery: ->
    if confirm('Delete ' + @state.grocery.item_name)
      $.ajax(
        url: '/groceries/' + @state.grocery.id,
        method: 'DELETE'
        data: @state.grocery
      )
      window.location.href = '/'

  purchasedAt: ->
    if @state.grocery.purchased_date
      React.DOM.p
        className: 'grocery'
        @state.grocery.item_name + ' was purchased on ' + @state.grocery.purchased_date + '.'
    else
      null

  render: ->
    React.DOM.div null,
      React.DOM.p
        className: 'grocery'
        @state.grocery.item_name
      React.DOM.p
        className: 'grocery'
        @state.grocery.status
      @purchasedAt()
      React.DOM.button
        onClick: @updatePurchasedAt
        'Update Purchased Date'
      React.DOM.button
        onClick: @deleteGrocery
        'Delete Grocery'
