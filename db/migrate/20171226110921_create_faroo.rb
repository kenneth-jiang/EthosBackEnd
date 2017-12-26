class CreateFaroo < ActiveRecord::Migration[5.1]
  def change
    create_table :faroo do |t|
      t.string :title
      t.string :kwic
      t.string :content
      t.string :url
      t.string :image_url
      t.string :author
      t.integer :votes

      t.timestamps null: true
    end
  end
end
