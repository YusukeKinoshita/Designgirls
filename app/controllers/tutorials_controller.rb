class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :edit, :update, :destroy, :question, :answer]

  # GET /tutorials
  # GET /tutorials.json
  def index
    @tutorials = Tutorial.all
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show 
    @user = current_user
    @user.progress = @tutorial.id
    @user.save

    if @tutorial.self_flag == 1
      @slide = @tutorial.slides.find_by(order: params[:slide_order])
      render 'tutorials/show2'
    end
  end

  # GET /tutorials/new
  def new    
    # @category = Category.find(params[:category_id])
    # @tutorial = @category.tutorials.build
    @tutorial = Tutorial.new
  end

  # GET /tutorials/1/edit
  def edit
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = Tutorial.new(tutorial_params)
    file = params[:tutorial][:userfile]
    @tutorial.set_image(file)
    # raise
    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to edit_tutorial_path(id: @tutorial.id), notice: 'Tutorial was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tutorial }
      else
        format.html { render action: 'new' }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorials/1
  # PATCH/PUT /tutorials/1.json
  def update
    # @category = Category.find(params[:category_id])
    file = params[:tutorial][:userfile]
    @tutorial.set_image(file)
    respond_to do |format|
      if @tutorial.update!(tutorial_params)
        format.html { redirect_to tutorial_path(id: @tutorial.id), notice: 'Tutorial was successfully updated.' } 
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial.destroy
    respond_to do |format|
      format.html { redirect_to tutorials_url }
      format.json { head :no_content }
    end
  end

  def slides
  end

  def question
  end

  def answer
    # answers == [1, 3, 4, 2, 1]
    answers = params[:answer] 
    # correct_answers = [1, 0, 1, 0, 0]
    @correct_answers = []
    answers.each_with_index do |answer, index| 
      # indexには何周目のループかが入ってる
      # 該当する質問を取り出す
      question = @tutorial.questions.find_by(order: index + 1)
      # is_correctにはtrueかfalse
      is_correct = question.selects.find_by(order: answer).answer == 1
      if is_correct
        @correct_answers.push(1)
      else
        @correct_answers.push(0)
      end
    end

  end

  def done
    render json: @hoge, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_params
      params.require(:tutorial).permit(:title, :user_id, :description, :category_id, slides_attributes: [:id, :slide_id, :title, :body, :image])
    end
end
