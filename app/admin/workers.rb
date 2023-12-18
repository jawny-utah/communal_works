ActiveAdmin.register Worker do
  permit_params :user_id, :description, :looking_for_work
end
