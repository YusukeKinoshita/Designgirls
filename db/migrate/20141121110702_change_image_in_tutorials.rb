class ChangeImageInTutorials < ActiveRecord::Migration
  def change
  	change_column(:tutorials, :image, :string)
  end
end
