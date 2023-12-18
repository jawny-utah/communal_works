class CreateUserCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :worker_categories do |t|
      t.references :worker, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
