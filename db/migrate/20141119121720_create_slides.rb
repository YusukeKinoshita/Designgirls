class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.integer :tutorial_id
      t.string :body
      t.string :image

      t.timestamps
    end
  end
end
