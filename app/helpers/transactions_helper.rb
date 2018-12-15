module TransactionsHelper
  def money(amount_cents)
    return '' if amount_cents.nil?

    number_to_currency(amount_cents/100.0)
  end
end
