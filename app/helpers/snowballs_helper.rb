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
end
