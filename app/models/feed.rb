class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  validates :image, presence: true
  validates :content, length: { maximum: 300 }

  def favorite?(feed, user)
  feed.favorites.find_by(user_id: user.id)
  end

end
