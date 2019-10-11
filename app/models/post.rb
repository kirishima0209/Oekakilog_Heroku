class Post < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true
  validates :user_id, presence: true
  
  belongs_to :user
  has_many :post_details, :dependent => :destroy
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  
  mount_uploader :image, ImageUploader
end
