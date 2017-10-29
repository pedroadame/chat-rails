require 'rails_helper'
require 'support/login_helper'

RSpec.feature "RoomAppearsInListWhenCreated", type: :feature do
  include LoginHelper

  before do
    login_with_capybara!
  end

  scenario 'room appears by websocket connection at start of list', js: true do
    5.times { create :room }
    visit rooms_path
    expect(page).to have_selector(".room", count: 5)
    room = create :room
    expect(page).to have_selector(".room", count: 6)
    expect(first(".room")).to have_text(room.name)
  end

end
