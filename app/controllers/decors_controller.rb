class DecorsController < ApplicationController
  before_action :set_user, only: %i[show index create unlisted]
  def index
    @decors = @user.decors.ordered_by_most_recent
    @total = @decors.pluck(:price).sum
  end
  
  def new
    @categories_array = Category.all.map { |category| [category.name, category.id] }
  end
  
   def create
    new_decor = @user.decors.build(decor_params)
    if new_decor.save
      DecorCategory.create(decor_id: new_decor.id, category_id: params[:name])
      flash[:notice] = 'You successfully created a new decor.'
      redirect_to user_decors_path
    else
      render 'new'
    end
   end

  def unlisted; end

  private
  
  def decor_params
    params.require(:decor).permit(:name, :price)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
