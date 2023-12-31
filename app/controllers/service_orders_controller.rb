class ServiceOrdersController < ApplicationController
  before_action :require_authorization
  before_action :service_order, except: %i(new create)

  def new
    @service_order = ServiceOrder.new
  end

  def create
    @service_order = ServiceOrder.create(service_order_params.merge(user_id: current_user.id))

    if @service_order.valid?
      redirect_to personal_informations_path
    else
      flash[:error] = @service_order.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
    return redirect_to root_path unless @service_order.worker.id == current_user.worker&.id ||
                                        @service_order.user.id == current_user.id
  end

  def update
    return redirect_to root_path unless @service_order.worker.id == current_user.worker&.id ||
                                        @service_order.user.id == current_user.id

    @service_order.update(service_order_params)
    redirect_to service_order_path(@service_order)
  end

  def destroy
    return redirect_to root_path unless @service_order.worker.id == current_user.worker&.id ||
              @service_order.user.id == current_user.id ||
              @service_order.not_cancelled?

    @service_order.update(service_order_params)
    @service_order.cancelled!

    if @service_order.cancelled_by_user
      redirect_to personal_informations_path
    else
      redirect_to worker_accounts_path
    end
  end

  def cancellation_reason; end

  def rate
    return redirect_to root_path unless @service_order.user.id == current_user.id
  end

  private

  def service_order
    @service_order = ServiceOrder.find_by(id: params[:id])
  end

  def service_order_params
    params.require(:service_order).permit(:description, :contact_info, :service_id, :status,
                                          :cancellation_reason, :cancelled_by_user, :rate, :rate_message)
  end
end
