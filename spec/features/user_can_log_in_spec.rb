require 'rails_helper'

RSpec.describe 'UserCanLogIn', type: :feature do
  scenario 'User logs in introducing his name' do
    visit root_url
    expect(page).to have_text "Introduce tu nombre"
    fill_in "user[name]", with: "Pedro"

    click_button "Entrar"

    expect(page).to have_text "Bienvenido, Pedro"
    expect(page).to have_text "Elige una sala"
  end

  scenario 'User can\'t log in without introducing username' do
    visit root_url
    click_button "Entrar"
    expect(page).to have_css(".new-user-form")
    expect(page).to have_css(".validation-error")
  end
end
