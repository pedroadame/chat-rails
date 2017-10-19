class RoomsChannel < ActionCable::Channel::Base
  def subscribed
    stream_from specific_channel
  end

  def receive(data)
    msg = Message.create content: data["message"], user: current_user, room_id: params[:room_id]
    if msg.valid?
      ActionCable.server.broadcast specific_channel, format_response(msg)
    end
  end

  private
  def specific_channel
    "room_#{params[:room_id]}"
  end

  def format_response(data)
    {
      message: data.content,
      username: current_user.name,
      message_id: data.id
    }
  end
end
