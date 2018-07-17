class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # saving the user id in the sessions hash, browser cookie
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Wrong user/password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logout with success"
    redirect_to root_path
  end


end
