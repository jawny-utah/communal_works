ActiveAdmin.register ServiceOrder do
  permit_params :service_id, :user_id, :status, :description, :contact_info, :rate, :cancellation_reason, :cancelled_by_user, :rate_message
end
