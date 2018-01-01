class CreateWolfram < ActiveRecord::Migration[5.1]
  def change
    create_table :wolfram do |t|
      t.string :wolfram_data
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
