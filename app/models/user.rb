class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 } 
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/i }, on: :create
  validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/i }, on: :update, allow_blank: true
  
  has_secure_password
  
  mount_uploader :image, ImageUploader
  
  has_many :posts, :dependent => :destroy
  has_many :favorites
  has_many :favorites_posts, through: :favorites, source: 'post'
end
