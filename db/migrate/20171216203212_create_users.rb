class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.string :profile_pic
      t.string :status
      t.string :biography
      t.string :interests

      t.timestamps
    end
  end
end
