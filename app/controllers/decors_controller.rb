class DecorsController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[show index create destroy unlisted update edit new]
  before_action :require_user, only: %i[unlisted destroy index edit update create new]
  before_action :set_decor, only: %i[edit destroy update]

  def index
    @decors = @user.decors.ordered_by_most_recent.includes(:categories)
    @total = @decors.pluck(:price).sum
  end

  def new
    @decor = Decor.new
  end

  def edit; end

  def update
    if @decor.update(decor_params)
      redirect_to user_decors_path, notice: 'Decor was successfully edited.'
    else
      render 'edit'
    end
  end

  def create
    @decor = @user.decors.build(decor_params)
    if @decor.save
      redirect_to user_decors_path, notice: 'You successfully created a new decor.'
    else
      render 'new'
    end
  end

  def unlisted
    @decors = @user.decors.ordered_by_most_recent.includes([:categories]).select { |decor| decor.categories.empty? }
    @total = @decors.pluck(:price).sum
  end

  def destroy
    @decor.categories.delete_all unless @decor.categories.empty?
    @decor.destroy
    redirect_to user_decors_path, notice: 'Decor successfully deleted.'
  end

  private

  def decor_params
    params.require(:decor).permit(:name, :price, category_ids: [])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_decor
    @decor = Decor.find(params[:id])
  end

  def require_user
    redirect_to user_decors_path(current_user) if current_user != @user
  end
end
