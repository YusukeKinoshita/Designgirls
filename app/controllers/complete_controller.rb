class CompletesController < ApplicationController

 def create
    @slide = Slide.find(params[:slide_id])
    current_user.like!(@tutorial)
  end

  def destroy
    @slide = Complete.find(params[:id]).slide
    current_user.uncomplete!(@slide)
  end
end