class CreateUsertutorials < ActiveRecord::Migration
  def change
    create_table :usertutorials do |t|
      t.string :title
      t.integer :user_id
      t.string :description
      t.string :image
      t.integer :category_id
      t.integer :level
      t.string :slideshare

      t.timestamps
    end
  end
end
