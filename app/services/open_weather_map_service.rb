class OpenWeatherMapService
  include HTTParty
  base_uri ENV["OPEN_WEATHER_URL"]

  def self.current_weather(city)
    options = { query: { q: city, appid: ENV['OPEN_WEATHER_MAP_API_KEY'] } }

    response = get('/data/2.5/weather', options)
  end

  def self.current_air_pollution(lat,lon)
    options = { query: { lat: lat, lon:lon, appid: ENV['OPEN_WEATHER_MAP_API_KEY'] } }

    response = get('/data/2.5/air_pollution', options)
  end

  def self.geocoding(city)
    options = { query: { q: city, appid: ENV['OPEN_WEATHER_MAP_API_KEY'] } }
    response = get('/geo/1.0/direct', options)
  end
end

