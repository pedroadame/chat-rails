class Room < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: true

  has_many :messages
  has_many :users, through: :messages

  after_commit :broadcast_new_room

  private
  def broadcast_new_room
    ActionCable.server.broadcast "room_list",
      room: render_room
  end

  def render_room
    RoomsController.render partial: 'room',
      locals: { room: self }
  end
end
