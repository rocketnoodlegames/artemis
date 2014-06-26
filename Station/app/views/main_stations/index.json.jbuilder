json.array!(@main_stations) do |main_station|
  json.extract! main_station, :id, :name, :money, :size, :defense, :armor, :shields, :weapons, :ships, :medical, :enemy
  json.url main_station_url(main_station, format: :json)
end
