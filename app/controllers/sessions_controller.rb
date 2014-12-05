class SessionsController < ApplicationController

  # def new
  # end

<<<<<<< HEAD
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
=======
  # def create
  #   user = User.find_by(email: params[:session][:email])
  #   if user && user.authenticate(params[:session][:password])
  #     sign_in user
  #     redirect_to root_path
  #   else
  #     flash.now[:error] = 'Invalid email/password combination'
  #     render 'new'
  #   end
  # end
>>>>>>> f6bb75c31e0792df9b91a7d9c4159eacb3eeaad1

  # def destroy
  #   sign_out
  #   redirect_to root_url
  # end
end