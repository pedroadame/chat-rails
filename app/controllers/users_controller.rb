class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      cookies.signed[:user_id] = @user.id
      redirect_to rooms_path
    else
      render :new 
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end