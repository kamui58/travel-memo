class Post < ApplicationRecord
  belongs_to :user
  belongs_to :place
  accepts_nested_attributes_for :place

  mount_uploader :image, ImageUploader
end
