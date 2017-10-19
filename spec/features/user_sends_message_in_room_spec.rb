require 'rails_helper'
require 'support/login_helper'

RSpec.feature "UserSendsMessageInRoom", type: :feature do
  include LoginHelper

  let!(:room) { create :room_with_messages }

  before do
    login_with_capybara!
  end

  scenario 'User sends message in room and appears last' do
    message = "Test message"
    visit room_url(room)
    expect(page).to have_css(".message", count: 20)
    fill_in "message[content]", with: message
    click_button "Enviar"

    visit room_url(room)
    expect(page).to have_css(".message", count: 20)

    expect(first(".message", text: message)).to eq(all(".message").last)

  end
end
