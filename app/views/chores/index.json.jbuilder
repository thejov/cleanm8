json.array!(@chores) do |chore|
  json.extract! chore, :id, :name
  json.url chore_url(chore, format: :json)
end
