class Post < ApplicationRecord
  belongs_to :user
  # belongs_to :prefecture
  # belongs_to :place

  mount_uploader :image, ImageUploader
end
