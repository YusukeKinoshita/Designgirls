class AddUsertutorialidToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :usertutorial_id, :integer
  end
end
