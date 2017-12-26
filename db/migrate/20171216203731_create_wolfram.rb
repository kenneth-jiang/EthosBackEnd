class CreateWolfram < ActiveRecord::Migration[5.1]
  def change
    create_table :wolfram do |t|
      t.string :result_id
      t.string :titles, array: true
      t.string :image_urls, array: true
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
