class Youtube < ApplicationRecord
  self.table_name = 'youtube'
  belongs_to :user
end
