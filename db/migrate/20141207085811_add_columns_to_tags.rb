class AddColumnsToTags < ActiveRecord::Migration
  def change
    add_column :tags, :category_id, :integer
    add_column :tags, :tutorial_id, :integer
  end
end
