class RemoveLevelFromTutorials < ActiveRecord::Migration
  def change
    remove_column :tutorials, :sex, :integer
  end
end
