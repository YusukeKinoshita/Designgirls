class AboutController < ApplicationController
  def index
  	# render :layout => false 
  	if signed_in?
  		@categories = Category.all
  		@current_tutorial = Tutorial.find(current_user.progress)

  		@slide = @current_tutorial.slides.find_by(order: params[:slide_order])
  		@usertutorials = Usertutorial.limit(4)
  		@products = Product.limit(4)
  		render 'categories/index'
  	end
  end
end

