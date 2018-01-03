class Reddit < ApplicationRecord
  self.table_name = 'reddit'
  belongs_to :user
end
