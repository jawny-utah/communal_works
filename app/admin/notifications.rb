ActiveAdmin.register Notification do
  permit_params :user_id, :work_account_notification, :read, :record_id, :record_class, :body
end
