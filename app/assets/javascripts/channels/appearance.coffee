App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    user = JSON.parse(data)
    if user.online
      $('#'+user.username+'').remove()
      $('#users').append "<div class='item' id='"+user.username+"'>"+user.username+"</div>"
    else
      $('#'+user.username+'').remove()