class DecorCategoriesController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[new create]
  before_action :require_user, only: %i[new create]

  def new
    @decor = Decor.find(params[:decor_id])
  end

  def create
    DecorCategory.create(decor_id: params[:decor_id], category_id: params[:decor_category][:category_id])
    redirect_to user_decors_path
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def require_user
    redirect_to user_decors_path(current_user) if current_user != @user
  end
end
