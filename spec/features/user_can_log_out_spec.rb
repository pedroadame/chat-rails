require 'rails_helper'
require 'support/login_helper'

RSpec.feature "UserCanLogOut", type: :feature do
  include LoginHelper

  before do
    login_with_capybara!
  end

  scenario 'User logs out and new login is required', js: true do
    expect(page).to have_css(".rooms")
    accept_confirm do
      # Poltergeist/Capybara doesn't find link correctly, although is visible
      find(".logout-link", visible: false).trigger('click')
    end
    expect(page).to have_selector(".login-input")

  end
end
