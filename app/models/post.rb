class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  belongs_to :user
  has_many :participates, dependent: :destroy
  has_many :participated_users, through: :participates, source: :user
end
