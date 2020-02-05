class MessagePrefecture < ApplicationRecord
  belongs_to :message
  belongs_to :prefecture
end
