class TransactionsController < ApplicationController
    def extrato
      @transactions = Transaction.all
      @transfer_transactions = current_user.transfer_transactions.order(created_at: :desc)
    end
  end