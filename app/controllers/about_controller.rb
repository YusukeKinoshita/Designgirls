class AboutController < ApplicationController
  def index
  	if signed_in?
  		@categories = Category.all
  		render 'categories/index'
  	end
  end
end
