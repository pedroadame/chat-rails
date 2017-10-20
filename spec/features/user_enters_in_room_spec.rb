require 'rails_helper'
require 'support/login_helper'

RSpec.feature "UserEntersInRoomSpec", type: :feature do
  include LoginHelper

  let! (:room) { create :room_with_messages }

  before do
    login_with_capybara!
  end

  scenario 'User click in a room and enters it. It shows the last 20 messages' do
    visit rooms_url
    click_link room.name
    expect(page).to have_css("#room[data-room-id='#{room.id}']")
    expect(page).to have_text(room.name)
    expect(page).to have_css("#messages")
    expect(page).to have_css("#chat-box")
    expect(page).to have_css(".message", count: 20)
  end
end
