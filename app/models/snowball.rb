class Snowball < ApplicationRecord
  has_many :accounts

  def to_s
    name
  end
end
