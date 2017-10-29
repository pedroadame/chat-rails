class Message < ApplicationRecord
  validates :content, presence: true
  validates :user, presence: true

  belongs_to :room

  scope :for_display, -> { order(:created_at).last(20) }
end
