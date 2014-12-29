class AddShortdescriptionToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :short_description, :string
  end
end
