module AccountsHelper
  def percentage(number)
    number_to_percentage number, strip_insignificant_zeros: true
  end
end
