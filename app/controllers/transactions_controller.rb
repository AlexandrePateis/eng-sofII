class TransactionsController < ApplicationController
    def extrato
      @transactions = current_user.transactions
      @transfer_transactions = current_user.transfer_transactions
    end
  end