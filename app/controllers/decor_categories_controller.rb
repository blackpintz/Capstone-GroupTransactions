class DecorCategoriesController < ApplicationController
  def new; end

  def create
    DecorCategory.create(decor_id: params[:decor_id], category_id: params[:decor_category][:category_id])
    redirect_to user_decors_path
  end
end
