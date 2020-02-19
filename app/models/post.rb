class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :post_image, PostImageUploader
  has_many :participates, dependent: :destroy
  has_many :participated_users, through: :participates, source: :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :date, presence: true
  validates :address, presence: true
  validates :user_id, presence: true
  validate  :post_image_size
  geocoded_by :address
  after_validation :geocode

  private

  # アップロードされた画像のサイズをバリデーションする
  def post_image_size
    if post_image.size > 5.megabytes
      errors.add(:picture, "5MB以下の画像にしてください")
    end
  end
end
