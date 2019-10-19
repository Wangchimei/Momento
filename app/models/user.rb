class User < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  has_many :feeds, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_feeds, through: :favorites, source: :feed

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 30 }
end
