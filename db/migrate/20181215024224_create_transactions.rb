class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :account, foreign_key: true
      t.date :date
      t.string :description
      t.integer :amount_cents

      t.timestamps
    end
  end
end
