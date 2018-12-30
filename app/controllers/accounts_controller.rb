class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def show
    @transactions = @account.transactions
    @new_transaction = Transaction.new(account: @account)
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    account_params = new_account_params
    initial_balance = parse_amount_cents account_params.delete(:initial_balance)
    minimum_payment = parse_amount_cents account_params.delete(:minimum_payment)

    @account = Account.new(account_params)
    Transaction.create!(account: @account,
                        date: Date.current,
                        description: "Initial balance",
                        amount_cents: initial_balance,
                        minimum_payment_amount_cents: minimum_payment)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    account_params = update_account_params
    minimum_payment = parse_amount_cents account_params.delete(:minimum_payment)

    account_params.merge!(minimum_payment_amount_cents: minimum_payment)

    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    snowball = @account.snowball
    @account.destroy

    respond_to do |format|
      format.html { redirect_to snowball, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_account
    @account = Account.find(params[:id])
  end

  def new_account_params
    params.require(:account).permit(:name, :snowball_id, :interest_rate, :initial_balance, :minimum_payment)
  end

  def update_account_params
    params.require(:account).permit(:name, :snowball_id, :interest_rate, :minimum_payment)
  end
end
