@SingleGrocery = React.createClass
  getInitialState: ->
    grocery: @props.grocery

  purchasedAt: ->
    if @state.grocery.purchased_at
      React.DOM.p
        className: 'grocery'
        @state.grocery.name + ' was purchased on ' + @state.grocery.purchased_at
    else
      null

  render: ->
    React.DOM.div null,
      React.DOM.p
        className: 'grocery'
        @state.grocery.name
      React.DOM.p
        className: 'grocery'
        @state.grocery.status
      @purchasedAt()

