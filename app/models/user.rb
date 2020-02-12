class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :participates, dependent: :destroy
  has_many :participated_posts, through: :participates, source: :post
  validates :name,  presence: true, length: { maximum: 50 }

  def already_participated?(post)
    self.participates.exists?(post_id: post.id)
  end
end
