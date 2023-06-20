class TransactionsController < ApplicationController
  def extrato
    @transactions = current_user.transactions.order(created_at: :desc).page(params[:page]).per(15)
    @transfer_transactions = current_user.transfer_transactions.page(params[:page]).per(15)
  end
end
