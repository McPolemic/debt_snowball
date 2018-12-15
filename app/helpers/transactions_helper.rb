module TransactionsHelper
  def money(amount_cents)
    number_to_currency(amount_cents/100.0)
  end
end
