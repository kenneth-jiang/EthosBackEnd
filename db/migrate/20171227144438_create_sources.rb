class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :sourceid
      t.string :name
      t.string :description
      t.string :url
      t.string :category
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end
