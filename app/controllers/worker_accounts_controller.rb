class WorkerAccountsController < ApplicationController
  before_action :require_authorization

  def show
    @worker_account = current_user.worker
    redirect_to root_path unless @worker_account
  end

  def edit
    @worker = current_user.worker
  end
end
