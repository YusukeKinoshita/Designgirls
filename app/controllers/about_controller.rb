class AboutController < ApplicationController
  def index
  	# render :layout => false 
  	if signed_in?
  		@categories = Category.all
  		@current_tutorial = Tutorial.find(current_user.progress)
  		render 'categories/index'
  	end
  end
end
