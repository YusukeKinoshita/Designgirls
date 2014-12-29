class AddContentToSelects < ActiveRecord::Migration
  def change
    add_column :selects, :content, :string
  end
end
