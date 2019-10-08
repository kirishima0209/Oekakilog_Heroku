class Post < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true
  validates :user_id, presence: true
  
  belongs_to :user
  has_many :post_details
  
  mount_uploader :image, ImageUploader
end
