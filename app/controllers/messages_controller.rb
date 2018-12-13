class MessagesController < ApplicationController
  before_action :require_user

  def create
    # current_user comes from the helper methods
    # build method would make the associations by itself
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", body: message.body,
                                                       user: message.user.username
      # Action Cable will send a broadcast to all users subscribed to the "chatroom_channel"
    else
      render 'chatroom/index'
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

end