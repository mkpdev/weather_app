class WeathersController < ApplicationController

  def current_air_pollution
    air_pollution = OpenWeatherMapService.current_air_pollution(params[:lat],params[:lon])
    if air_pollution.code == 200
      @air = air_response(air_pollution)
    end
  end

  def geocoding
    geocoding = OpenWeatherMapService.geocoding(params[:city])
    if geocoding.code == 200 && !(geocoding.empty?)
      @geocode = geocoding_response(geocoding)
    end
  end

  private

  def air_response(response)
    {
      aqi: response["list"].first["main"]["aqi"],
      co: response["list"].first["components"]["co"],
      no: response["list"].first["components"]["no"],
      no2: response["list"].first["components"]["no2"],
      o3: response["list"].first["components"]["o3"],
      so2: response["list"].first["components"]["so2"],
      pm2_5: response["list"].first["components"]["pm2_5"],
      pm10: response["list"].first["components"]["pm10"],
      nh3: response["list"].first["components"]["nh3"]
    }
  end

  def geocoding_response(response)
    {
      latitude: response.first["lat"],
      longitude: response.first["lon"],
      country: response.first["country"],
      state: response.first["state"]
    }
  end
end
