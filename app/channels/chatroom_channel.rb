class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # This enables us to work with the data that is streamed from here
    # Action Cable works by subscribing a user to a particular channel, which allows that user’s browser to be updated via a WebSocket
    stream_from "chatroom_channel"
  end

  def unsubscribed
    # Any cleanup needed when we close/unsubscribe from the channel
  end

end