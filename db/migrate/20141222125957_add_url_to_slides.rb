class AddUrlToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :youtube, :string
    add_column :slides, :slideshare, :string
  end
end
