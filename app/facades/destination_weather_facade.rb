class DestinationWeatherFacade
  def self.fetch_destination_weather_data(id)
    destination = Destination.find(id)
    zip = destination.zip
    weather_data = WeatherService.weather_info(zip)
    weather = Weather.new(weather_data)
    summary = weather.summary
    image_data = ImageService.image_info(summary)
    image = Image.new(image_data)
    DestinationWeather.new(destination, weather, image)
  end
end
