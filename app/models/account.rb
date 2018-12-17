class Account < ApplicationRecord
  belongs_to :snowball
  has_many :transactions, dependent: :destroy

  # Optimization: These three methods (initial_balance, current_balance, and
  # current_balance) could be calculated when transactions are saved and stored
  # on the account
  def initial_balance
    transactions.order(:date).first.amount_cents
  end

  def current_balance
    transactions.map(&:amount_cents).sum
  end

  def current_difference
    current_balance - initial_balance
  end

  def to_s
    name
  end
end
