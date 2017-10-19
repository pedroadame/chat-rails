class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def authenticate_user!
    @current_user ||= User.find_by_id(session[:user_id])
    if @current_user.nil?
      redirect_to root_path, notice: "Debes registrarte antes"
    end
  end
end
