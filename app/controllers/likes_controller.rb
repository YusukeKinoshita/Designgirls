class LikesController < ApplicationController

  def create
    @usertutorial = Usertutorial.find(params[:usertutorial_id])
    current_user.like!(@usertutorial)
  end

  def destroy
    @usertutorial = Like.find(params[:id]).usertutorial
    current_user.unlike!(@usertutorial)
  end
end