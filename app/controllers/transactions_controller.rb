class TransactionsController < ApplicationController
    before_action :set_user, only: [:show, :index, :unlisted]
    def index
      @transactions = @user.transactions
      @total = @transactions.pluck(:amount).sum
    end
    
    def unlisted
      #do not have a group.
      #command to run for the icons.
    end
    
    
    private
    
  def set_user
    @user = User.find(params[:user_id])
  end
end
