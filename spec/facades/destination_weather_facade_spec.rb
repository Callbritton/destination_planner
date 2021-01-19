require 'rails_helper'

describe DestinationWeatherFacade do
  context ".find_destination_weather_data" do
    it "returns all data for a given destination including weather and image" do
      destination = Destination.create(
        id: 1,
        name: "Powhatan",
        zip: 23139,
        description: "A lil too red",
        image_url: "powhatan.jpg"
      )

      data = DestinationWeatherFacade.fetch_destination_weather_data(destination.id)

      expect(data).to be_a(DestinationWeather)
      expect(data.id).to be_a(Integer)
      expect(data.date).to be_a(String)
      expect(data.summary).to be_a(String)
      expect(data.image).to be_a(String)
      expect(data.zip).to be_a(String)
# The temps vary between float and integer so these tests are set to Numeric:
      expect(data.current_temp).to be_a(Numeric)
      expect(data.high_temp).to be_a(Numeric)
      expect(data.low_temp).to be_a(Numeric)
    end
  end
end
