class Prefecture < ApplicationRecord
  has_many :message_prefectures
  has_many :messages, through: :message_prefectures
end
