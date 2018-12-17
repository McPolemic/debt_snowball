class AddInterestRateToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :interest_rate, :float
  end
end
