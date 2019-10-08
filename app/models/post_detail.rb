class PostDetail < ApplicationRecord
  validates :post_id, presence: true
  validates :content, presence: true
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader
  
  belongs_to :post
end
