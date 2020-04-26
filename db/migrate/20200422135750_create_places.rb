class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name,                 null: false
      t.bigint :prefecture
      t.timestamps
    end
  end
end
