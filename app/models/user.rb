class User < ApplicationRecord
  has_secure_password

  has_many :searches
  has_many :personalities

  validates [:username, :password, :password_confirmation, :full_name, :email], presence: true
end
