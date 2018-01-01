class CreatePersonalities < ActiveRecord::Migration[5.1]
  def change
    create_table :personalities do |t|
      t.string :personality_data
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
