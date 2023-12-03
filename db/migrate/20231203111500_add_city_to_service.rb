class AddCityToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :city, :string
    add_column :users, :city, :string
  end
end
