ActiveAdmin.register User do
  permit_params :full_name, :phone_number, :username, :email, :date_of_birth, :password_digest, :city
end
