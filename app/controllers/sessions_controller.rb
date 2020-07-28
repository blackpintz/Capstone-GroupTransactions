class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully.'
      redirect_to user_path(user)
    else
      flash.now[:alert] = 'Wrong username.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You are logged out.'
    redirect_to login_path
  end
end
