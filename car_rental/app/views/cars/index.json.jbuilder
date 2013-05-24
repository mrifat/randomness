json.array!(@cars) do |car|
  json.extract! car, :type, :model, :rent_price, :state
  json.url car_url(car, format: :json)
end