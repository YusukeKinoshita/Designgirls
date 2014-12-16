class AddCategoryIdToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :category_id, :integer
  end
end
