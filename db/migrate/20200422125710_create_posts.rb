class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :message
      t.text :image
      t.references :user,       null: false, foreign_key: true 
      t.bigint :place_id
      t.timestamps
    end
  end
end
