require 'rails_helper'

describe WeatherFacade do
  context ".fetch_weather_data" do
    it "returns the weather data for a given zip code" do
      data = WeatherFacade.fetch_weather_data(94040)

      expect(data).to be_a(Weather)
      expect(data.date).to be_a(String)
      expect(data.summary).to be_a(String)
# The temps vary between float and integer so these tests are set to Numeric:
      expect(data.current_temp).to be_a(Numeric)
      expect(data.high_temp).to be_a(Numeric)
      expect(data.low_temp).to be_a(Numeric)
    end
  end
end
