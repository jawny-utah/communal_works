class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :already_authorized?
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def already_authorized?
    if logged_in?
      flash[:warning] = "Ви вже авторизовані!"
      redirect_to root_path
    end
  end
end
