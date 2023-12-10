class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.boolean :work_account_notification
      t.boolean :read
      t.bigint :record_id
      t.string :record_class
      t.string :body

      t.timestamps
    end
  end
end
