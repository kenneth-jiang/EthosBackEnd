class CreatePersonalities < ActiveRecord::Migration[5.1]
  def change
    create_table :personalities do |t|
      t.string :openness
      t.string :conscientiousness
      t.string :extraversion
      t.string :agreeableness
      t.string :neuroticism
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
