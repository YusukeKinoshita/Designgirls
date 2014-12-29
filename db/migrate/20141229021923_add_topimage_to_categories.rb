class AddTopimageToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :topimg, :string
  end
end
