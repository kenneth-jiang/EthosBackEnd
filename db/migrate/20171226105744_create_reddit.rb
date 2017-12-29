class CreateReddit < ActiveRecord::Migration[5.1]
  def change
    create_table :reddit do |t|
      t.string :redditId
      t.string :title
      t.string :author
      t.string :created_utc
      t.string :num_comments
      t.string :permalink
      t.string :subreddit_name_prefixed
      t.string :subreddit_id
      t.string :thumbnail
      t.string :url
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
