class AddOrderToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :order, :integer
  end
end
