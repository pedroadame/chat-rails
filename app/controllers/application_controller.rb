class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def authenticate_user!
    if current_user.nil?
      redirect_to root_path, notice: "Debes registrarte antes"
    end
  end

  def ensure_not_logged_in!
    if current_user
      redirect_to rooms_path, notice: "Debes cerrar sesion antes"
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
