require 'rails_helper'
require 'support/login_helper'

RSpec.feature "UserSendsMessageInRoom", type: :feature do
  include LoginHelper

  let!(:room) { create :room_with_messages }

  before do
    login_with_capybara!
  end

  scenario 'User sends message in room and appears last', js: true do
    message = "Test message"
    visit room_path(room)
    expect(page).to have_css(".chat-message", count: 20)
    fill_in "chat-box", with: message
    find("#chat-box").send_keys(:return)
    expect(page).to have_css(".chat-message", count: 21)
    expect(first(".chat-message", text: message)).to eq(all(".chat-message").last)
  end
end
