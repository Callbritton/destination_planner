class DestinationWeather
  attr_reader :date,
              :id,
              :current_temp,
              :high_temp,
              :low_temp,
              :summary,
              :name,
              :zip,
              :image

  def initialize(destination, weather, image)
    @name = destination.name
    @date = weather.date
    @current_temp = weather.current_temp
    @high_temp = weather.high_temp
    @low_temp = weather.low_temp
    @summary = weather.summary
    @id = destination.id
    @image = image.url
    @zip = destination.zip
  end
end
