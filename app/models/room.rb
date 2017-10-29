class Room < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: true

  has_many :messages
  has_many :users, through: :messages

  after_commit :broadcast_new_room

  scope :for_display, -> { order(created_at: :desc) }

  private
  def broadcast_new_room
    ActionCable.server.broadcast "room_list",
      room: self
  end
end
