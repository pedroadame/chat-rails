class Message < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :room

  scope :for_display, -> { order(:created_at).last(20) }
end
