require 'rails_helper'
require 'support/login_helper'

RSpec.feature "UserGoesBackToRoomsListFromRoom", type: :feature do
  include LoginHelper

  before do
    login_with_capybara!
  end

  let!(:room) { create :room }

  scenario "User clicks go back button and goes to room list" do
    visit room_url(room)
    click_link "Salir de la sala"
    expect(page).to have_css(".rooms")
  end
end
