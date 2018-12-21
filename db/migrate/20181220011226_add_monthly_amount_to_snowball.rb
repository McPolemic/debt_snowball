class AddMonthlyAmountToSnowball < ActiveRecord::Migration[5.2]
  def change
    add_column :snowballs, :monthly_amount_cents, :integer
  end
end
