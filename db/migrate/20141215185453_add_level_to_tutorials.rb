class AddLevelToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :level, :integer
  end
end
