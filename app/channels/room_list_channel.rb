class RoomListChannel < ActionCable::Channel::Base
  def subscribed
    stream_from "room_list"
  end
end
