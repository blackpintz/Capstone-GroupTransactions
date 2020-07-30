class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def new; end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    flash[:notice] = "Welcome #{@user.username}"
    redirect_to user_path(@user)
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
