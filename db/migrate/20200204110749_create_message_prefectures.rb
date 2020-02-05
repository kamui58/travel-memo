class CreateMessagePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :message_prefectures do |t|
      t.references :message, null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true
      t.timestamps
    end
  end
end
