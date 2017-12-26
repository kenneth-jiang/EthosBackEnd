class CreateSpotify < ActiveRecord::Migration[5.1]
  def change
    create_table :spotify do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.integer :popularity
      t.string :image_url
      t.string :uri
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
