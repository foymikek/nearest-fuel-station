class SearchController < ApplicationController
  def index
    conn = Faraday.new("https://developer.nrel.gov")
    location_search = params[:location].delete(",").gsub(" ", "+")
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=TlE9xIEdvQo5yi2i4rOpahuoYZkHaBnZDCigksHe&location=#{location_search}")
    gas_station_result = JSON.parse(response.body, symbolize_names: true)
    nearest_gas_station = gas_station_result[:fuel_stations].first
    require 'pry'; binding.pry
     nearest_gas_station[:station_name]
     nearest_gas_station[:street_address]
     nearest_gas_station[:fuel_type_code]
     nearest_gas_station[:access_days_time]
  end
end
# response = conn.get("/directions/v2/route?key=XKrd3r5KBbA81mysYlkh1yrvF8lSSSN4&from=#{search}&outFormat=json&ambiguities=ignore&routeType=fastest&doReverseGeocode=false&enhancedNarrative=false&avoidTimedConditions=false")
