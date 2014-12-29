class FinishesController < ApplicationController

 def create
    @userslide = Userslide.find(params[:userslide_id])
    current_user.finish!(@userslide)
  end

  def destroy
    @userslide = Finish.find(params[:id]).userslide
    current_user.unfinish!(@userslide)
  end
end