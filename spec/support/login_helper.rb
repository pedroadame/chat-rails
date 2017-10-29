module LoginHelper
  def login! with_capybara = false
    if with_capybara
      visit root_path
      fill_in "username", with: Faker::Internet.user_name
      click_button "Entrar"
    else
      # @user = create :user
      # session[:user_id] = @user.id
    end
  end

  def login_with_capybara!
    login! true
  end
end
