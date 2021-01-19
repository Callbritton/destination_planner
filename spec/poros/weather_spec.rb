require 'rails_helper'

RSpec.describe Weather do
  it "exists" do
    attrs = {
      :coord=>{:lon=>24.91, :lat=>50.23},
      :weather=>
      [{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
      :base=>"stations",
      :main=>
      {:temp=>55,
        :feels_like=>51.73,
        :temp_min=>55,
        :temp_max=>55,
        :pressure=>749,
        :humidity=>97},
        :visibility=>10000,
        :wind=>{:speed=>8.1, :deg=>252},
        :clouds=>{:all=>2},
        :dt=>1599623476,
        :sys=>
        {:type=>3,
          :id=>2011559,
          :country=>"UA",
          :sunrise=>1599623254,
          :sunset=>1599670080},
          :timezone=>10800,
          :id=>703716,
          :name=>"Lutsk",
          :cod=>200
      }

    weather = Weather.new(attrs)

    expect(weather.date).to eq(Time.at(attrs[:dt]).strftime("%A, %B %e"))
    expect(weather.current_temp).to eq(attrs[:main][:temp])
    expect(weather.low_temp).to eq(attrs[:main][:temp_min])
    expect(weather.high_temp).to eq(attrs[:main][:temp_max])
    expect(weather.summary).to eq(attrs[:weather][0][:description])
  end
end
