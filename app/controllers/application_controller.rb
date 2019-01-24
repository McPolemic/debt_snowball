class ApplicationController < ActionController::Base
  def parse_amount_cents(amount_text)
    return nil if amount_text.blank?

    amount = amount_text.gsub(/[$,]/, '').to_f

    # Convert to cents
    (amount * 100).to_i
  end
end
