module LoginHelper
  def login! with_capybara = false
    @user = create :user
    if with_capybara
      page.set_rack_session(user_id: @user.id)
    else
      session[:user_id] = @user.id
    end
  end

  def login_with_capybara!
    login! true
  end
end
