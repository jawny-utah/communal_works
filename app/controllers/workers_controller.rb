class WorkersController < ApplicationController
  before_action :require_authorization, except: :index

  def index
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.create(worker_params.merge(user_id: current_user.id))

    if @worker.valid?
      redirect_to worker_accounts_path
    else
      flash[:error] = @worker.errors.full_messages.join(" ")
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @worker = current_user.worker

    if @worker.update(worker_params)
      redirect_to worker_accounts_path
    else
      flash[:error] = @worker.errors.full_messages.join(" ")
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:category, :description, :looking_for_work)
  end
end
