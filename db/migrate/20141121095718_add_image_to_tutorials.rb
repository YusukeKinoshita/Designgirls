class AddImageToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :image, :integer
  end
end
