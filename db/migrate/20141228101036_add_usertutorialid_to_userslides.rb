class AddUsertutorialidToUserslides < ActiveRecord::Migration
  def change
    add_column :userslides, :usertutorial_id, :integer
  end
end
