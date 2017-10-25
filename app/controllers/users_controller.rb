class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :logout]
  before_action :ensure_not_logged_in!, only: [:new, :create]

  layout 'login'

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      # Para ActionCable
      cookies.signed[:user_id] = @user.id
      redirect_to rooms_path
    else
      render :new
    end
  end

  def logout
    if current_user == User.find(params[:id])
      session[:user_id] = nil
      redirect_to root_path, notice: "Sesion cerrada correctamente"
    else
      redirect_to rooms_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
