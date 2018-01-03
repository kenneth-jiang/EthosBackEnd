class Api::V1::MessagesController < ApplicationController
  def index
    @messages = Message.all
    render json: @messages
  end

  def create
    @message = Message.create(message_params)
    Search.create(search_term: @message.content, user_id: my_user.id)
    ActionCable.server.broadcast "room_channel",
                                  content: @message.content,
                                  username: @message.username,
                                  time: @message.time
  end

  private

  def message_params
    params.require(:message).permit(:content, :username, :time, :user_id)
  end

end
