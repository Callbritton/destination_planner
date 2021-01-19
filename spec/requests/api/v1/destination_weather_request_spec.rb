require 'rails_helper'

describe 'Get weather info for destination' do
  it "should return JSON with info" do
    destination1 = Destination.create(
        name: 'Mountain View',
        zip: '94040',
        description: '1st destination',
        image_url: 'https://dh-prod-cdn.azureedge.net/-/media/property/jdv/avante/downtown-mountain-view-crpd1400x500.jpg?ts=8e91427c-9122-40bc-9fda-c5a32e074a85'
      )

    get "/api/v1/destination-weather/#{destination1.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data][:attributes]).to have_key(:date)
    expect(parsed[:data][:attributes]).to have_key(:current_temp)
    expect(parsed[:data][:attributes]).to have_key(:high_temp)
    expect(parsed[:data][:attributes]).to have_key(:low_temp)
    expect(parsed[:data][:attributes]).to have_key(:summary)
    expect(parsed[:data][:attributes]).to have_key(:image)
    expect(parsed[:data][:attributes]).to have_key(:name)
  end
end
