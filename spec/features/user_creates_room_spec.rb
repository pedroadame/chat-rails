require 'rails_helper'
require 'support/login_helper'

RSpec.feature "UserCreatesRoom", type: :feature, js: true do
  include LoginHelper

  before do
    login_with_capybara!
    visit rooms_path
    click_link "Nueva sala"
  end

  scenario 'User creates and enters a room' do
    text =  "Test room"

    fill_in "room[name]", with: text, visible: false
    find(".button.is-success", visible: false).trigger('click')

    expect(page).to_not have_text("Nueva sala")
    expect(page).to have_text(text)
    expect(page).to have_css(".messages")
  end

  scenario 'User inserts empty name and no room is created' do
    find(".button.is-success", visible: false).trigger('click')
    expect(page).to have_css(".room-errors.notification.is-danger", visible: false)
  end

  scenario 'User inserts already taken name' do
    find(".button.is-success", visible: false).trigger('click')
    expect(page).to have_css(".room-errors.notification.is-danger", visible: false)
  end
end
