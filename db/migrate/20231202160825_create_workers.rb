class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.belongs_to :user
      t.string :category, null: false
      t.string :description, null: false
      t.boolean :looking_for_work, defaul: true

      t.timestamps
    end
  end
end
