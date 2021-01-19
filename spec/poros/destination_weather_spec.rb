require 'rails_helper'

RSpec.describe DestinationWeather do
  it "exists" do
    destination = Destination.create(
      id: 1,
      name: "Powhatan",
      zip: 23139,
      description: "A lil too red",
      image_url: "powhatan.jpg"
    )
    weather = WeatherFacade.fetch_weather_data(23139)
    image = ImageFacade.fetch_image_data(weather.summary)

    destination_weather = DestinationWeather.new(destination, weather, image)

    expect(destination_weather.id).to eq(destination.id)
    expect(destination_weather.zip).to eq(destination.zip)
    expect(destination_weather.date).to eq(weather.date)
    expect(destination_weather.current_temp).to eq(weather.current_temp)
    expect(destination_weather.high_temp).to eq(weather.high_temp)
    expect(destination_weather.low_temp).to eq(weather.low_temp)
    expect(destination_weather.summary).to eq(weather.summary)
    expect(destination_weather.image).to eq(image.url)
  end
end
