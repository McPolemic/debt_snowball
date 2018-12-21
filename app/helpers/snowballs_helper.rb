module SnowballsHelper
  def money_color_class(amount)
    if amount >  0
      'money-positive'
    elsif amount < 0
      'money-negative'
    else
      ''
    end
  end

  def remaining_duration(total_amount, monthly_amount)
    return "" unless total_amount.present? && monthly_amount.present?

    total_amount = total_amount.to_i.abs
    number_of_months = total_amount / monthly_amount
    remaining = total_amount % monthly_amount

    number_of_months += 1 unless remaining.zero?

    # Simplify and determine the number of equivalent years
    number_of_years = 0
    until number_of_months < 12
      number_of_months -= 12
      number_of_years += 1
    end

    # Assemble our duration string
    duration = ""
    duration += "#{number_of_years} #{"year".pluralize(number_of_years)}, " unless number_of_years.zero?
    duration + "#{number_of_months} #{"month".pluralize(number_of_months)}"
  end
end
