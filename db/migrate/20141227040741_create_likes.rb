class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :tutorial_id

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :tutorial_id
    add_index :likes, [:user_id, :tutorial_id], unique: true
  end
end
