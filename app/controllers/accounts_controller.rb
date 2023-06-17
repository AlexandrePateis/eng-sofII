class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy, :deposit, :withdraw]
  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
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
      redirect_to account_path(@account), notice: 'Account was successfully created.'
    else
      render :new
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

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def withdraw

    withdraw_amount = params[:withdraw_amount].to_f
    if withdraw_amount <= @account.balance
      @account.update(balance: @account.balance - withdraw_amount)
      redirect_to account_path(@account), notice: 'Saque feito com sucesso !'
    else
      redirect_to account_path(@account), alert: 'Saldo insuficiete! Você não pode sacar mais do que tem em saldo.'
    end
  end

  def deposit
    deposit_amount = params[:deposit_amount].to_d
    if @account.update(balance: @account.balance + deposit_amount)
      redirect_to account_path(@account), notice: 'Depósito feito com sucesso.'
    else
      redirect_to account_path(@account), alert: 'Falha ao fazer o depósito.'
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:account_number, :balance)
    end
end
