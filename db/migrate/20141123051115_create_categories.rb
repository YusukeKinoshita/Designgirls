class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
