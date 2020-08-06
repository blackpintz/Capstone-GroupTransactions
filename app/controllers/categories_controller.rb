class CategoriesController < ApplicationController
  before_action :require_login
  before_action :set_category, only: %i[show edit update]
  before_action :require_user, only: %i[edit update]
  before_action :icons_array, only: %i[new create edit update]

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:notice] = 'You successfully created a new category.'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully edited.'
    else
      render 'edit'
    end
  end

  def index
    @categories = Category.all.alphabetical_order.includes(:user)
  end

  def show
    @decors = @category.decors.includes(:user)
    @total = @decors.pluck(:price).sum
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def icons_array
    @category_array = icons
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def require_user
    redirect_to categories_path if current_user != @category.user
  end
end
