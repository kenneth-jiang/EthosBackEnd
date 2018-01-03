class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :name
      t.string :author
      t.string :description
      t.string :url
      t.string :image_url
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
