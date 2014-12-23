class AddSelfFlagToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :self_flag, :integer
  end
end
