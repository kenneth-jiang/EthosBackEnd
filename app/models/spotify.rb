class Spotify < ApplicationRecord
  self.table_name = 'spotify'
  belongs_to :user
end
