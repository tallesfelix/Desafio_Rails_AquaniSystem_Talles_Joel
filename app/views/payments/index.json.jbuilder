json.array!(@payments) do |payment|
  json.extract! payment, :id, :name, :value, :description
  json.url payment_url(payment, format: :json)
end
