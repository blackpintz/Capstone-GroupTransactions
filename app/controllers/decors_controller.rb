class DecorsController < ApplicationController
  before_action :set_user, only: %i[show index create unlisted]
  def index
    @decors = @user.decors.ordered_by_most_recent
    @total = @decors.pluck(:price).sum
  end

  def new; end

  def create
    new_decor = @user.decors.build(decor_params)
    if new_decor.save
      flash[:notice] = 'You successfully created a new decor.'
      redirect_to user_decors_path
    else
      render 'new'
    end
  end

  def unlisted
    @decors = @user.decors.with_no_category.ordered_by_most_recent
    @total = @decors.pluck(:price).sum
  end

  private

  def decor_params
    params.require(:decor).permit(:name, :price, :category_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
