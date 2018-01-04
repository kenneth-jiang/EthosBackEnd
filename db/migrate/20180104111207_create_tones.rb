class CreateTones < ActiveRecord::Migration[5.1]
  def change
    create_table :tones do |t|
      t.string :tone_data
      t.integer :user_id

      t.timestamps
    end
  end
end
