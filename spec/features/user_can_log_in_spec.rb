require 'rails_helper'

RSpec.describe 'UserCanLogIn', type: :feature do
  scenario 'User logs in introducing his name' do
    visit root_url
    fill_in "user[name]", with: "Pedro"

    click_button "Entrar"

    expect(page).to have_text "Conectado como Pedro"
    expect(page).to have_selector(".rooms")
  end

  scenario 'User can\'t log in without introducing username' do
    visit root_url
    click_button "Entrar"
    expect(page).to have_css(".new-user-form")
    expect(page).to have_css(".validation-error")
  end
end
