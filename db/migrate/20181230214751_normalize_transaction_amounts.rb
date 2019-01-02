class NormalizeTransactionAmounts < ActiveRecord::Migration[5.2]
  class MigrationTransaction < ActiveRecord::Base
    self.table_name = :transactions
  end
  def change
    # Before this point, amounts owed were stored as negative numbers (as a
    # bank would store it). After this point, they're stored as positive
    # numbers due to the tool's focus on paying off debts.
    MigrationTransaction.find_each do |transaction|
      transaction.update!(amount_cents: -transaction.amount_cents)
    end
  end
end
