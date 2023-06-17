class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy, :deposit, :withdraw]
  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
  end

  def transfer_form
    @account = Account.find(params[:id])

    # Lógica para exibir o formulário de transferência
  end
  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = current_user.build_account
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user = current_user
  
    if @account.save
      redirect_to account_path(@account), notice: 'Conta criado com sucesso'
    else
      render :new
    end
  end

  def transfer
    @source_account = current_user.account
    @target_account = Account.find_by(account_number: params[:account_number])
    amount = params[:amount].to_f
  
    if @target_account && amount > 0 && @source_account.balance >= amount
      ActiveRecord::Base.transaction do
        @source_account.update(balance: @source_account.balance - amount)
        @target_account.update(balance: @target_account.balance + amount)
      end
      redirect_to accounts_path, notice: 'Transferência realizada com sucesso.'
    else
      redirect_to accounts_path, alert: 'Falha na transferência. Verifique os dados da conta de destino e o saldo da sua conta.'
    end
  end
  
  
  def deposit_form
    @account = Account.find(params[:id])
  end

  def withdraw_form
    @account = Account.find(params[:id])
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end  
  
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # DELETE /accounts/1 or /accounts/1.json


  def withdraw

    withdraw_amount = params[:withdraw_amount].to_f
    if withdraw_amount <= @account.balance
      @account.update(balance: @account.balance - withdraw_amount)
      Transaction.create(user_id: current_user.id, account_id: @account.id, action: 'Saque', amount: withdraw_amount)
      redirect_to account_path(@account), notice: 'Saque feito com sucesso !'
    else
      redirect_to account_path(@account), alert: 'Saldo insuficiete! Você não pode sacar mais do que tem em saldo.'
    end
  end

  def deposit
    
    deposit_amount = params[:deposit_amount].to_d
    if @account.update(balance: @account.balance + deposit_amount)
      Transaction.create(user_id: current_user.id, account_id: @account.id, action: 'Deposito', amount: deposit_amount)
      redirect_to account_path(@account), notice: 'Depósito feito com sucesso.'
    else
      redirect_to account_path(@account), alert: 'Falha ao fazer o depósito.'
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.account
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:account_number, :balance, :user_id)
    end
end
