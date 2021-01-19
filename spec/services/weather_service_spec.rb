require 'rails_helper'

describe WeatherService do
  context ".weather_info" do
    it "returns weather information for a given zipcode" do
      weather_service = WeatherService.weather_info(94040)

      expect(weather_service).to be_a(Hash)
      expect(weather_service[:weather][0][:description]).to be_a(String)
      expect(weather_service[:dt]).to be_a(Integer)
    # The temps vary between floats and integers, so these tests are Numeric:
      expect(weather_service[:main][:temp]).to be_a(Numeric)
      expect(weather_service[:main][:temp_min]).to be_a(Numeric)
      expect(weather_service[:main][:temp_max]).to be_a(Numeric)
    end
  end
end
