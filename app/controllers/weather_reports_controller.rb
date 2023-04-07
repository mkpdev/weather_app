class WeatherReportsController < ApplicationController
  def new
    @weather_report = WeatherReport.new 
  end

  def create
    weather = get_current_weather
    weather[:city] = params[:city] if weather.present?
    @weather_report = current_user.weather_reports.new(weather)
    if @weather_report.save
      redirect_to @weather_report
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @weather_reports = current_user.weather_reports.all
  end

  def show
    @weather_report = WeatherReport.find(params[:id])
  end

  def destroy
    @weather_report = WeatherReport.find(params[:id])
    if @weather_report.destroy
      redirect_to weather_reports_path, status: :see_other
    end
  end

  private

  def get_current_weather
    current_weather = OpenWeatherMapService.current_weather(params[:city])
    weather_response(current_weather) if current_weather.code == 200
  end

  def weather_response(response)
    {
      temperature: response['main']['temp'],
      description: response['weather'][0]['description'],
      humidity: response['main']['humidity'],
    }
  end
end
