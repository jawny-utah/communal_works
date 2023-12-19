ActiveAdmin.register Service do
  permit_params :worker_id, :title, :description, :price, :status, :city, :rejection_reason
  filter :status, as: :select, collection: Service.statuses
end
