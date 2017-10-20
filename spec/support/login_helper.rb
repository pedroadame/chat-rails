module LoginHelper
  def login! with_capybara = false
    @user = create :user
    if with_capybara
      visit root_path
      fill_in "user[name]", with: @user.name
      click_button "Entrar"
    else
      session[:user_id] = @user.id
    end
  end

  def login_with_capybara!
    login! true
  end
end
