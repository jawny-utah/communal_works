class ServicesController < ApplicationController
  before_action :worker_account_presence, :require_authorization, except: :show
  before_action :service, only: %i(show edit update destroy)

  def new
    @service = Service.new
  end

  def create
    @service = Service.create(service_params.merge(worker_id: current_user.worker.id))

    if @service.valid?
      redirect_to service_path(@service)
    else
      flash[:error] = @service.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    redirect_to root_path if current_user.worker.id != @service.worker.id

    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      flash[:error] = @service.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to root_path if current_user.worker.id != @service.worker.id

    @service.destroy
    redirect_to worker_accounts_path
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :price)
  end

  def worker_account_presence
    redirect_to worker_accounts_path if current_user&.worker&.nil?
  end

  def service
    @service ||= Service.find_by(id: params[:id])
  end
end
