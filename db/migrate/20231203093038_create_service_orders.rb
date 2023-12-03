class CreateServiceOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_orders do |t|
      t.belongs_to :service
      t.belongs_to :user
      t.integer :status, default: 0
      t.string :description
      t.string :contact_info
      t.integer :rate
      t.string :cancellation_reason
      t.boolean :cancelled_by_user

      t.timestamps
    end
  end
end
