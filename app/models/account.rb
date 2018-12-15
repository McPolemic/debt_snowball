class Account < ApplicationRecord
  belongs_to :snowball
  has_many :transactions

  def current_balance
    transactions.map(&:amount_cents).sum
  end

  def to_s
    name
  end
end
