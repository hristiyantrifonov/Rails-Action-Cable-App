App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Chatroom channel connected')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Chatroom channel disconnected')

  received: (data) ->
    console.log('Chat Message: ' + JSON.stringify(data))
    unless data.body.blank?
      $('.ui.feed').append '<div class="event">' +
       '<div class="content">' + '<div class="summary">' +
        '<em>' + data.user + '</em>: ' + data.body +
        '</div>' + '</div>' + '</div>'

