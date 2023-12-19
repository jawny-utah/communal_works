class NotificationsController < ApplicationController
  before_action :require_authorization

  def index
    @pagy, @notifications = pagy(Notification.where(user_id: current_user.id))
  end

  def destroy
    @notification = Notification.find_by(id: params[:id])
    @notification.destroy

    redirect_to notifications_path
  end

  def destroy_all
    @notifications = current_user.notifications
    @notifications.destroy_all

    redirect_to notifications_path
  end
end
