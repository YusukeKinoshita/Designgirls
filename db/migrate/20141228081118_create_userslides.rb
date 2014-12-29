class CreateUserslides < ActiveRecord::Migration
  def change
    create_table :userslides do |t|
      t.string :title
      t.integer :tutorial_id
      t.string :body
      t.string :image
      t.string :youtube
      t.integer :order

      t.timestamps
    end
  end
end
