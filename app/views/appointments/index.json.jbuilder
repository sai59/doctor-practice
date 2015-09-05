json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :visit, :pet_id, :customer_id, :reminder, :reason
  json.url appointment_url(appointment, format: :json)
end
