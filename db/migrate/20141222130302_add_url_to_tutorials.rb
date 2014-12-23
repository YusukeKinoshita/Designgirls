class AddUrlToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :slideshare, :string
  end
end
