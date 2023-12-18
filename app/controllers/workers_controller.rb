class WorkersController < ApplicationController
  before_action :require_authorization, except: %i(index show)

  def index
    workers = Worker.all
    workers = workers.joins(:categories).where(categories: { id: params[:category_ids] }) if params[:category_ids].present? && params[:category_ids] != [""]
    workers = workers.order(created_at: params[:order_by]&.to_sym) if params[:order_by].present? && params[:order_by] != [""]
    @pagy, @workers = pagy(workers)
  end

  def show
    @worker = Worker.find_by(id: params[:id])
    @pagy, @services = pagy(@worker.services)
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.create(worker_params.merge(user_id: current_user.id))

    if @worker.valid?
      redirect_to worker_accounts_path
    else
      flash[:error] = @worker.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @worker = current_user.worker

    if @worker.update(worker_params)
      redirect_to worker_accounts_path
    else
      flash[:error] = @worker.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:description, :looking_for_work, category_ids: [])
  end
end
