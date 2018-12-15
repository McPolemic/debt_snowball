class Account < ApplicationRecord
  belongs_to :snowball
  has_many :transactions

  def to_s
    name
  end
end
