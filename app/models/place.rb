class Place < ApplicationRecord
  has_many :posts

  
  # 北海道
  scope :hokkaido, -> { where(prefecture: "北海道")}
  # 東北地方
  scope :iwate, -> { where(prefecture: "岩手県")}
  scope :aomori, -> { where(prefecture: "青森県")}
  scope :akita, -> { where(prefecture: "秋田県")}
  scope :miyagi, -> { where(prefecture: "宮城県")}
  scope :yamagata, -> { where(prefecture: "山形県")}
  scope :fukushima, -> { where(prefecture: "福島県")}
  # 関東地方
  scope :ibaraki, -> { where(prefecture: "茨城県")}
  scope :gunma, -> { where(prefecture: "群馬県")}
  scope :saitama, -> { where(prefecture: "埼玉県")}
  scope :kanagawa, -> { where(prefecture: "神奈川県")}
  scope :chiba, -> { where(prefecture: "千葉県")}
  scope :tokyo, -> { where(prefecture: "東京都")}
  scope :tochigi, -> { where(prefecture: "栃木県")}
  # 中部地方
  scope :aichi, -> { where(prefecture: "愛知県")}
  scope :gifu, -> { where(prefecture: "岐阜県")}
  scope :yamanashi, -> { where(prefecture: "山梨県")}
  scope :niigata, -> { where(prefecture: "新潟県")}
  scope :shizuoka, -> { where(prefecture: "静岡県")}
  scope :ishikawa, -> { where(prefecture: "石川県")}
  scope :nagano, -> { where(prefecture: "長野県")}
  scope :toyama, -> { where(prefecture: "富山県")}
  scope :fukui, -> { where(prefecture: "福井県")}
  # 近畿地方
  scope :kyoto, -> { where(prefecture: "京都府")}
  scope :mie, -> { where(prefecture: "三重県")}
  scope :shiga, -> { where(prefecture: "滋賀県")}
  scope :osaka, -> { where(prefecture: "大阪府")}
  scope :nara, -> { where(prefecture: "奈良県")}
  scope :hyogo, -> { where(prefecture: "兵庫県")}
  scope :wakayama, -> { where(prefecture: "和歌山県")}
  # 中国地方
  scope :okayama, -> { where(prefecture: "岡山県")}
  scope :hiroshima, -> { where(prefecture: "広島県")}
  scope :yamaguchi, -> { where(prefecture: "山口県")}
  scope :tottori, -> { where(prefecture: "鳥取県")}
  scope :shimane, -> { where(prefecture: "島根県")}
  # 四国地方
  scope :kochi, -> { where(prefecture: "高知県")}
  scope :ehime, -> { where(prefecture: "愛媛県")}
  scope :tokushima, -> {where(prefecture: "徳島県")}
  scope :kagawa, -> { where(prefecture: "香川県")}
  # 九州地方
  scope :miyazaki, -> { where(prefecture: "宮崎県")}
  scope :kumamoto, -> { where(prefecture: "熊本県")}
  scope :saga, -> { where(prefecture: "佐賀県")}
  scope :kagoshima, -> { where(prefecture: "鹿児島県")}
  scope :oita, -> { where(prefecture: "大分県")}
  scope :nagasaki, -> { where(prefecture: "長崎県")}
  scope :fukuoka, -> { where(prefecture: "福岡県")}
  # 沖縄県
  scope :okinawa, -> { where(prefecture: "沖縄県")}

end
