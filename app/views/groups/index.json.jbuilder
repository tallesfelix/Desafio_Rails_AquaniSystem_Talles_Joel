json.array!(@groups) do |group|
  json.extract! group, :id, :name, :schedule, :teacher, :obs
  json.url group_url(group, format: :json)
end
