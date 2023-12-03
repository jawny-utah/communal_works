class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.belongs_to :worker
      t.string :title, null: false
      t.string :description, null: false
      t.float :price, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
