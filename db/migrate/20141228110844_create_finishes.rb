class CreateFinishes < ActiveRecord::Migration
  def change
    create_table :finishes do |t|
      t.integer :user_id
      t.integer :userslide_id

      t.timestamps
    end
    add_index :finishes, :user_id
    add_index :finishes, :userslide_id
    add_index :finishes, [:user_id, :userslide_id], unique: true
  end
end
