class LikesController < ApplicationController

  def create
    @tutorial = Tutorial.find(params[:tutorial_id])
    current_user.like!(@tutorial)
  end

  def destroy
    @tutorial = Like.find(params[:id]).tutorial
    current_user.unlike!(@tutorial)
  end
end