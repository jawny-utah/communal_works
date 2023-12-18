class WorkerAccountsController < ApplicationController
  before_action :require_authorization, :worker_account_presence

  def show
    @worker_account = current_user.worker
    @pagy, @services = pagy(@worker_account.services)
  end

  def edit
    @worker = current_user.worker
  end

  def service_orders
    @worker_account = current_user.worker
    @pagy, @service_orders = pagy(@worker_account.service_orders.order(created_at: :desc))
  end

  private

  def worker_account_presence
    redirect_to worker_accounts_path if current_user&.worker&.nil?
  end
end
