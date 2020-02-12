class Post < ApplicationRecord
  belongs_to :user
  has_many :participates, dependent: :destroy
  has_many :participated_users, through: :participates, source: :user
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :date, presence: true
  validates :address, presence: true
  validates :user_id, presence: true
  geocoded_by :address
  after_validation :geocode
end
