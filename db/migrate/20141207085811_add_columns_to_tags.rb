class AddColumnsToTags < ActiveRecord::Migration
  def change
    add_column :tags, :category_id, :integer
    add_column :tags, :tutorial_id, :integer
    add_index :tags, :category_id
    add_index :tags, :tutorial_id
    add_index :tags, [:category_id, :tutorial_id], unique: true
  end
end
