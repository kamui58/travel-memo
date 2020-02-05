class Message < ApplicationRecord
  belongs_to :user
  has_many :message_prefectures
  has_many :prefectures, through: :message_prefectures
  
  mount_uploader :image, ImageUploader
end
