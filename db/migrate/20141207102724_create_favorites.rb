class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
    add_index :favorites, :user_id
    add_index :favorites, :product_id
    add_index :favorites, [:user_id, :product_id], unique: true
  end
end
