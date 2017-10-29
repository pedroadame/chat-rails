class RoomListChannel < ActionCable::Channel::Base
  def subscribed
    stream_from "room_list"
  end

  def receive(data)
    room = Room.new name: data["room"]
    room.save
  end
end
