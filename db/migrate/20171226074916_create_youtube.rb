class CreateYoutube < ActiveRecord::Migration[5.1]
  def change
    create_table :youtube do |t|
      t.string :videoId
      t.string :channelId
      t.string :title
      t.string :description
      t.string :image_url
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
