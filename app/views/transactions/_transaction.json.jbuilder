json.extract! transaction, :id, :account_id, :date, :description, :amount_cents, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
