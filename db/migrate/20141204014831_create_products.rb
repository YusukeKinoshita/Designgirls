class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
