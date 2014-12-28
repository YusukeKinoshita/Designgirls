class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :tutorial_id
      t.string :question
      t.integer :order

      t.timestamps
    end
  end
end
