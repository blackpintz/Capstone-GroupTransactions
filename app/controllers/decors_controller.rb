class DecorsController < ApplicationController
  before_action :set_user, only: %i[show index unlisted]
  def index
    @decors = @user.decors.ordered_by_most_recent
    @total = @decors.pluck(:price).sum
  end

  def unlisted
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
