class TransactionsController < ApplicationController
  before_action :set_user, only: %i[show index create unlisted]
  def index
    @transactions = @user.transactions
    @total = @transactions.pluck(:amount).sum
  end
  
  def new
  end
  
  def create
    new_transaction = @user.transactions.build(transaction_params)
    if new_transaction.save
      flash[:notice] = 'You successfully created a new decor.'
      redirect_to user_all_decor_path
    else
      render 'new'
    end
  end

  def unlisted
  end

  private
  
  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
