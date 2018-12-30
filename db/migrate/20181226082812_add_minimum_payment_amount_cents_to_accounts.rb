class AddMinimumPaymentAmountCentsToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :minimum_payment_amount_cents, :integer
  end
end
