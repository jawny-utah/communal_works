class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :already_authorized?
  helper_method :logged_in?
  helper_method :require_authorization
  include Pagy::Backend

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

  def require_authorization
    redirect_to root_path unless logged_in?
  end

  def authenticate_admin
    # return true if Rails.env.development?
    authenticate_or_request_with_http_basic do |name, password|
      name == 'rid' && password == '123123'
    end
  end
end
