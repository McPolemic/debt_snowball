module TransactionsHelper
  def payment?(amount_cents)
    return true if amount_cents.nil?
    amount_cents <=0
  end

  def charge?(amount_cents)
    !payment?(amount_cents)
  end
end
