require 'rails_helper'
require 'support/login_helper'

RSpec.feature "UserCreatesRoom", type: :feature do
  include LoginHelper

  before do
    login_with_capybara!
    visit rooms_url
    click_link "Nueva sala"
  end

  scenario 'User creates and enters a room' do
    text =  "Test room"

    fill_in "room[name]", with: text
    click_button "Crear sala"

    expect(page).to_not have_text("Nueva sala")
    expect(page).to have_text(text)
    expect(page).to have_css("#messages")
  end

  scenario 'User inserts empty name and no room is created' do
    click_button "Crear sala"
    expect(page).to have_css(".new-room-form")
    expect(page).to have_css(".validation-error")
  end

  scenario 'User inserts already taken name' do
    click_button "Crear sala"
    expect(page).to have_css(".new-room-form")
    expect(page).to have_css(".validation-error")
  end
end
