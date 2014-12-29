class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @usertutorials = @user.usertutorials.paginate(page: params[:page])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    file = params[:user][:image]
    @user.set_image(file)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Design Girls!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    file = params[:user][:image]
    @user.set_image(file)
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    flash[:success] = "User destroyed."
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def favorite
    @title = 'Favorite Products'
    @product = current_user.products.build
    @feed_products = current_user.favorite_products.paginate(page: params[:page])
    render template: 'about/index'
  end

  def like
    @title = 'Like Tutorials'
    @tutorial = current_user.tutorials.build
    @feed_tutorials = current_user.like_tutorials.paginate(page: params[:page])
    render template: 'about/index'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


    # Before Action

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end


    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def current_user=(user)
      @current_user = user
    end

    def current_user?(user)
      user == current_user
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end