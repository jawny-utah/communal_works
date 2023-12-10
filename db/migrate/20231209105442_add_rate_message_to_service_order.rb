class AddRateMessageToServiceOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :service_orders, :rate_message, :string
  end
end
