class Account < ApplicationRecord
  belongs_to :snowball

  def to_s
    name
  end
end
