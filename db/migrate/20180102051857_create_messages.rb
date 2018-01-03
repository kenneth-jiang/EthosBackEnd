class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :username
      t.string :time
      t.integer :user_id

      t.timestamps
    end
  end
end
