json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :type, :breed, :age, :weight, :last_visit
  json.url pet_url(pet, format: :json)
end
