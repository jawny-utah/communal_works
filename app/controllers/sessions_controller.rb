class SessionsController < ApplicationController
  before_action :already_authorized?, only: %i(new create)

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Неправильна пошта або пароль."
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to request.referrer
  end
end
