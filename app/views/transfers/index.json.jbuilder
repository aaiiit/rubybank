json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :sender_account_id, :receiver_account_id, :amount
  json.url transaction_url(transaction, format: :json)
end
