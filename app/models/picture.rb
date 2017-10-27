class Picture < ApplicationRecord
  validates :image, presence: true
  validates :comment, length: { in: 0..140 } 
  belongs_to :user
  mount_uploader :image, ImageUploader
end
