class CategoriesController < ApplicationController
  def new; end

  def create
    new_category = Category.new(category_params)
    if new_category.save
      flash[:notice] = 'You successfully created a new category.'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def index
    @categories = Category.all.alphabetical_order
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
