class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :birthday
      t.string :location
      t.string :gender
      t.string :interests
      t.string :about
      t.string :profile_pic
      t.string :status
      t.boolean :private
      t.string :reddit_access_token
      t.string :reddit_refresh_token
      t.string :spotify_access_token
      t.string :spotify_refresh_token

      t.timestamps null: true
    end
  end
end
