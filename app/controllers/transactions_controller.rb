class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:edit, :update, :destroy]

  def new
    params.require(:account_id)

    @transaction = Transaction.new(account_id: @account_id)
  end

  def edit
  end

  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction.account, notice: 'Transaction was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction.account, notice: 'Transaction was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    account = @transaction.account
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to account, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    raw_params = params.require(:transaction).permit(:account_id, :date, :description, :amount, :charge_indicator, :new_balance)

    new_balance = parse_amount_cents raw_params.delete(:new_balance)
    charge_indicator = raw_params.delete(:charge_indicator)
    amount_cents = parse_amount_cents raw_params.delete(:amount)

    amount_cents = if new_balance
                     account_id = raw_params[:account_id]
                     current_balance = Account.find(account_id).current_balance

                     new_balance - current_balance
                   else
                     # Amount owed is a positive number. Therefore, payments are negative
                     # numbers. Additional charges are positive, adding to the balance.
                     case charge_indicator
                     when "payment"
                       -amount_cents
                     when "charge"
                       amount_cents
                     else
                       raise "Unknown state: #{charge_indicator.inspect}"
                     end
                   end

    raw_params.merge(amount_cents: amount_cents)
  end
end
