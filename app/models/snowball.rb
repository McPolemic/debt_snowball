class Snowball < ApplicationRecord
  has_many :accounts, dependent: :destroy

  def to_s
    name
  end
end
