class AddRejectionReasonForAdminInService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :rejection_reason, :string
  end
end
