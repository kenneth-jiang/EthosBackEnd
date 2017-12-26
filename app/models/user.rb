class User < ApplicationRecord
  has_secure_password

  has_many :personalities
  has_many :wolfram_searches
end
