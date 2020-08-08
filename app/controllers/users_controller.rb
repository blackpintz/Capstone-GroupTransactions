class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :require_login, only: %i[show]
  before_action :require_user, only: [:show]
  before_action :not_logged_in?, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_user
    redirect_to user_path(current_user) if current_user != @user
  end
end
