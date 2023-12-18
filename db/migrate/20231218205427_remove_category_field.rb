class RemoveCategoryField < ActiveRecord::Migration[7.0]
  def change
    remove_column :workers, :category
  end
end
