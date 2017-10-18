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
end
