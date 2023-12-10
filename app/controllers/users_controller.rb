class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :full_name,
                                 :phone_number, :email, :date_of_birth)
  end
end
