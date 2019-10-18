class Feed < ApplicationRecord
  validates :image, presence: true
  validates :content, length: { maximum: 300 }
  mount_uploader :image, ImageUploader
end
