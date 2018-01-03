class User < ApplicationRecord
  has_secure_password

  has_many :searches
  has_many :clicks

  has_many :personalities

  has_many :messages

  has_many :wolfram
  has_many :news
  has_many :sources
  has_many :youtube
  has_many :reddit
  has_many :spotify

end
