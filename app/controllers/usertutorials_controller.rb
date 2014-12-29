class UsertutorialsController < ApplicationController
  before_action :set_usertutorial, only: [:show, :edit, :update, :destroy]

  # GET /tutorials
  # GET /tutorials.json
  def index
    @usertutorials = Usertutorial.all
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show 
    @user = current_user
    # @user.progress = @usertutorial.id
    # @user.save
    @userslide = @usertutorial.userslides.find_by(order: params[:userslide_order])
  end

  # GET /tutorials/new
  def new    
    # @category = Category.find(params[:category_id])
    # @tutorial = @category.tutorials.build
    @usertutorial = Usertutorial.new
  end

  # GET /tutorials/1/edit
  def edit
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    @usertutorial = Usertutorial.new(usertutorial_params)
    file = params[:usertutorial][:userfile]
    @usertutorial.set_image(file)
    # raise
    respond_to do |format|
      if @usertutorial.save
        format.html { redirect_to edit_usertutorial_path(id: @usertutorial.id), notice: 'Usertutorial was successfully created.' }
        format.json { render action: 'show', status: :created, location: @usertutorial }
      else
        format.html { render action: 'new' }
        format.json { render json: @usertutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorials/1
  # PATCH/PUT /tutorials/1.json
  def update
    # @category = Category.find(params[:category_id])
    file = params[:usertutorial][:userfile]
    @usertutorial.set_image(file)
    respond_to do |format|
      if @usertutorial.update!(usertutorial_params)
        format.html { redirect_to usertutorial_path(id: @usertutorial.id), notice: 'Usertutorial was successfully updated.' } 
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @usertutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @usertutorial.destroy
    respond_to do |format|
      format.html { redirect_to usertutorials_url }
      format.json { head :no_content }
    end
  end

  def slides
  end

  def done
    render json: @hoge, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usertutorial
      @usertutorial = Usertutorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usertutorial_params
      params.require(:usertutorial).permit(:title, :user_id, :description, :category_id, userslides_attributes: [:id, :userslide_id, :title, :body, :image])
    end
end