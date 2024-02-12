class ChatroomChannel < ApplicationCable::Channel
  skip_before_action :verify_authenticity_token
  def subscribed
     stream_from 'chatroom_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
