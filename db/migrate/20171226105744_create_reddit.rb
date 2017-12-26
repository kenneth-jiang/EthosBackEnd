class CreateReddit < ActiveRecord::Migration[5.1]
  def change
    create_table :reddit do |t|

      t.timestamps null: true
    end
  end
end
