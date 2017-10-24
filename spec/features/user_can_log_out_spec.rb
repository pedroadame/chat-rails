require 'rails_helper'
require 'support/login_helper'

RSpec.feature "UserCanLogOut", type: :feature do
  include LoginHelper

  before do
    login_with_capybara!
  end

  scenario 'User logs out and new login is required', js: true do
    visit rooms_path
    expect(page).to have_css(".rooms")
    accept_confirm do
      click_link "Salir"
    end
    expect(page).to have_current_path(root_path)
    expect(page).to have_text("Sesion cerrada correctamente")

    visit rooms_path
    expect(page).to have_current_path(root_path)
    expect(page).to have_text("Debes registrarte antes")
  end
end
