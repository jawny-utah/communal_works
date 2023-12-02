class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :phone_number, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.date :date_of_birth
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
