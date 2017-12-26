class CreateClicks < ActiveRecord::Migration[5.1]
  def change
    create_table :clicks do |t|
      t.string :click_term
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
