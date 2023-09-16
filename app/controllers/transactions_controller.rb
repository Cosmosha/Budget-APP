class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.includes(:transactions).find_by_id(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new({ author_id: current_user.id, **transaction_params })
    @transaction.save

    redirect_to category_transactions_path(@category)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id)
  end
end
