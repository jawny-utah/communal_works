class WorkerAccountsController < ApplicationController
  before_action :require_authorization, :worker_account_presence

  def show
    @worker_account = current_user.worker
  end

  def edit
    @worker = current_user.worker
  end

  def service_orders
    @service_orders = current_user.worker.service_orders
    @worker_account = current_user.worker
  end

  private

  def worker_account_presence
    redirect_to worker_accounts_path if current_user&.worker&.nil?
  end
end
