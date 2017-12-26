class CreateWolframSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :wolfram_searches do |t|
      t.string :searches
      t.string :results
      t.string :favorites
      t.string :user_id

      t.timestamps
    end
  end
end
