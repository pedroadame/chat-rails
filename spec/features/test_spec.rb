require 'rails_helper'

RSpec.feature 'blah', type: :feature do
  scenario 'well k psa', js: true do
    visit "/pages/index"
    expect(page).to have_text("Find me")
  end
end
