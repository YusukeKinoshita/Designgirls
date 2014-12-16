class FavoritesController < ApplicationController
	
  def create
    @product = Product.find(params[:product_id])
    current_user.favorite!(@product)
  end

  def destroy
    @product = Favorite.find(params[:id]).product
    current_user.unfavorite!(@product)
  end
end
