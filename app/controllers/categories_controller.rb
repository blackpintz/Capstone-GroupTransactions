class CategoriesController < ApplicationController
  def new
    @category_array = icons
  end

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

  def show
    @category = Category.find(params[:id])
    @decors = @category.decors
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
