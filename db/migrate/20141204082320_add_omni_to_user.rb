class AddOmniToUser < ActiveRecord::Migration
  def change
    ##Omniauthable
    add_column :users, :uid, :integer, :limit => 8
    add_column :users, :provider, :string    
  end
  add_index :users, :uid,  :unique => true
end