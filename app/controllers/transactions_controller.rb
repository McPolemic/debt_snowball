class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:edit, :update, :destroy]

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
    raw_params = params.require(:transaction).permit(:account_id, :date, :description, :amount)
    amount_text = raw_params.delete(:amount)

    amount_cents = parse_amount_cents(amount_text)

    raw_params.merge(amount_cents: amount_cents)
  end
end
