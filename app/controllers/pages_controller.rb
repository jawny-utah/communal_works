class PagesController < ApplicationController
  def index
    services = Service.all
    services = services.joins(:categories).where(categories: { id: params[:category_ids] }) if params[:category_ids].present? && params[:category_ids] != [""]
    # services = services.where("title LIKE ?", "%#{params[:title]}%") if params[:title] != [""]
    services = services.order(created_at: params[:order_by]&.to_sym) if params[:order_by].present? && params[:order_by] != [""]
    @pagy, @services = pagy(services)
  end
end
