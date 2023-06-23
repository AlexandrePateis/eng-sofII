class TransactionsController < ApplicationController
  def extrato
    @ransack_search = current_user.transactions.ransack(params[:q])
    @transactions = @ransack_search.result.order(created_at: :desc)
  end
  
end
