class Wolfram < ApplicationRecord
  self.table_name = 'wolfram'
  belongs_to :user
end
