class AboutController < ApplicationController
  def index
  	# render :layout => false 
  	if signed_in?
  		@categories = Category.all
  		render 'categories/index'
  	end
  end
end
