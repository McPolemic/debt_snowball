class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.references :snowball, foreign_key: true

      t.timestamps
    end
  end
end
