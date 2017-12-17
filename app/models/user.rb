class User < ApplicationRecord
  has_secure_password

  has_many :searches
  has_many :personalities
end
