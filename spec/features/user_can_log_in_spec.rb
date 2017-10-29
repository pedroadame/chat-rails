require 'rails_helper'

RSpec.describe 'UserCanLogIn', type: :feature, js: true do
  scenario 'User logs in introducing his name' do
    visit root_path
    fill_in "username", with: "Pedro"

    click_button "Entrar"

    expect(page).to have_text "Conectado como Pedro"
    expect(page).to have_selector(".rooms")
  end

  scenario 'User can\'t log in without introducing username' do
    visit root_path
    click_button "Entrar"
    expect(page).to have_text("El nombre es demasiado corto")
  end
end
