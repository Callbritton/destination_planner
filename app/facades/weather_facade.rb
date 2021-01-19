class WeatherFacade
  def self.fetch_weather_data(zip)
    weather_data = WeatherService.weather_info(zip)
    Weather.new(weather_data)
  end
end
