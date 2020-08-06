class DecorCategoriesController < ApplicationController
  def new
    @decor = Decor.find(params[:decor_id])
    @user = User.find(params[:user_id])
  end

  def create
    DecorCategory.create(decor_id: params[:decor_id], category_id: params[:decor_category][:category_id])
    redirect_to user_decors_path
  end
end
