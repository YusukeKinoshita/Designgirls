class AddSoftwareToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :url, :string
    add_column :categories, :soft_image, :string
  end
end
