class User < ApplicationRecord
  has_secure_password

  has_many :searches
  has_many :clicks
  has_many :personalities

  has_many :spotify
  has_many :reddit
  has_many :faroo
  has_many :news
  has_many :wolfram
  has_many :youtube
  has_many :sources
end
