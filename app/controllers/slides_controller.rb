class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]

  # GET /slides
  # GET /slides.json
  def index
    @slides = Slide.all
  end

  # GET /slides/1
  # GET /slides/1.json
  def show
    
  end

  def change
    @slide = Slide.find(params[:id])
  end

  # GET /slides/new
  def new
    @tutorial = Tutorial.find(params[:tutorial_id])
    @slide = @tutorial.slides.build
  end

  # GET /slides/1/edit
  def edit
  end

  # POST /slides
  # POST /slides.json
  def create
    # @slide = current_tutorial.slides.built(slide_params)
    # @category = Category.find(params[:category_id])
    @tutorial = Tutorial.find(params[:tutorial_id])
    @slide = @tutorial.slides.build(slide_params)
    file = params[:slide][:image]
    @slide.set_image(file)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to tutorial_slide_path(tutorial_id: @tutorial.id, id: @slide.id), notice: 'Slide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @slide }
      else
        format.html { render action: 'new' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slides/1
  # PATCH/PUT /slides/1.json
  def update
    @category = Category.find(params[:category_id])
    @tutorial = Tutorial.find(params[:tutorial_id])
    file = params[:slide][:image]
    @slide.set_image(file)
    respond_to do |format|
      # @slide.image = params[:slide][:image].original_filename
      if @slide.update(slide_params)
        format.html { redirect_to tutorial_slide_path(tutorial_id: @tutorial.id, id: @slide.id), notice: 'Slide was successfully updated.' } 
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to tutorial_slides_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_params
      params.require(:slide).permit(:title, :body)
    end
end
