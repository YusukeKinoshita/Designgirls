class AddOmniToUser < ActiveRecord::Migration
  def change
    ##Omniauthable
    add_column :users, :uid, :integer, :limit => 8
    add_column :users, :provider, :string    
    add_index :users, [:uid, :provider], unique: true
  end
end