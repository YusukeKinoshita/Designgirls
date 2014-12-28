class UserslidesController < ApplicationController
  before_action :set_userslide, only: [:show, :edit, :update, :destroy]

  # GET /slides
  # GET /slides.json
  def index
    @userslides = Userslide.all
  end

  # GET /slides/1
  # GET /slides/1.json
  def show
  end

  # GET /slides/new
  def new
    @usertutorial = Usertutorial.find(params[:usertutorial_id])
    @userslide = @usertutorial.userslides.build
  end

  # GET /slides/1/edit
  def edit
  end

  # POST /slides
  # POST /slides.json
  def create
    # @slide = current_tutorial.slides.built(slide_params)
    # @category = Category.find(params[:category_id])
    @usertutorial = Usertutorial.find(params[:usertutorial_id])
    @userslide = @usertutorial.userslides.build(userslide_params)
    file = params[:userslide][:image]
    @userslide.set_image(file)

    respond_to do |format|
      if @userslide.save
        format.html { redirect_to usertutorial_userslide_path(usertutorial_id: @usertutorial.id, id: @userslide.id), notice: 'Userslide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @userslide }
      else
        format.html { render action: 'new' }
        format.json { render json: @userslide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slides/1
  # PATCH/PUT /slides/1.json
  def update
    @category = Category.find(params[:category_id])
    @usertutorial = Usertutorial.find(params[:usertutorial_id])
    file = params[:userslide][:image]
    @userslide.set_image(file)
    respond_to do |format|
      # @slide.image = params[:slide][:image].original_filename
      if @userslide.update(userslide_params)
        format.html { redirect_to usertutorial_userslide_path(usertutorial_id: @usertutorial.id, id: @userslide.id), notice: 'Userslide was successfully updated.' } 
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @userslide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @userslide.destroy
    respond_to do |format|
      format.html { redirect_to usertutorial_userslides_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userslide
      @userslide = Userslide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userslide_params
      params.require(:userslide).permit(:title, :body)
    end
end