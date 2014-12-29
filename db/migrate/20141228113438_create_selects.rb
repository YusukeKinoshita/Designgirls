class CreateSelects < ActiveRecord::Migration
  def change
    create_table :selects do |t|
      t.integer :question_id
      t.integer :answer
      t.integer :order

      t.timestamps
    end
  end
end
