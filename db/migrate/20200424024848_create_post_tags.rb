class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tags do |t|
      t.references :post,         null: false, foreign_key: true
      t.bigint :tag,              null: false
      t.timestamps
    end
  end
end
