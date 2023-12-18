class PersonalInformationsController < ApplicationController
  before_action :require_authorization, :user

  def show
    @pagy, @service_orders = pagy(@user.service_orders.order(created_at: :desc))
  end

  def edit
  end

  def update
    if @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user
    @user ||= current_user
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :full_name,
                                 :phone_number, :email, :date_of_birth)
  end
end
