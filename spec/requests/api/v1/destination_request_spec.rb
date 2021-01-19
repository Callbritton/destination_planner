require "rails_helper"

describe "Destination API" do
  before :each do
    @destination1 = Destination.create(
        name: 'Mountain View',
        zip: '94040',
        description: '1st destination',
        image_url: 'https://dh-prod-cdn.azureedge.net/-/media/property/jdv/avante/downtown-mountain-view-crpd1400x500.jpg?ts=8e91427c-9122-40bc-9fda-c5a32e074a85'
      )

    @destination2 = Destination.create(
        name: 'Virgina View',
        zip: '23139',
        description: '2nd destination',
        image_url: 'https://dh-prod-cdn.azureedge.net/-/media/property/jdv/avante/downtown-mountain-view-crpd1400x500.jpg?ts=8e91427c-9122-40bc-9fda-c5a32e074a85'
      )

    @destination3 = Destination.create(
        name: 'Denver View',
        zip: '80014',
        description: '3rd destination',
        image_url: 'https://dh-prod-cdn.azureedge.net/-/media/property/jdv/avante/downtown-mountain-view-crpd1400x500.jpg?ts=8e91427c-9122-40bc-9fda-c5a32e074a85'
      )
  end

  it "sends a list of destinations (INDEX)" do

    get '/api/v1/destinations'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    destinations = parsed[:data]

    expect(destinations.count).to eq(3)

    destinations.each do |destination|
      expect(destination).to have_key(:id)
      expect(destination[:id]).to be_an(String)

      expect(destination[:attributes]).to have_key(:name)
      expect(destination[:attributes][:name]).to be_a(String)

      expect(destination[:attributes]).to have_key(:zip)
      expect(destination[:attributes][:zip]).to be_a(String)

      expect(destination[:attributes]).to have_key(:image_url)
      expect(destination[:attributes][:image_url]).to be_a(String)
    end
  end

  it "can get one destination by id (SHOW)" do
    id = @destination1.id.to_s

    get "/api/v1/destinations/#{id}"

    parsed_data = JSON.parse(response.body, symbolize_names: true)
    destination_by_id = parsed_data[:data][:id]

    expect(response).to be_successful
    expect(parsed_data).to have_key(:data)
    expect(parsed_data).to be_a(Hash)
    expect(destination_by_id).to eq(id)

  end

  it "can create a new destination (CREATE)" do
    destination_params = ({
                    name: 'San Juan',
                    zip: '66756',
                    description: 'Beautiful',
                    image_url: 'Filled with suspense.jpg'
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    # We include this header to make sure that these params are passed as JSON rather than as plain text
    post "/api/v1/destinations", headers: headers, params: JSON.generate(destination_params)
    created_destination = Destination.last

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data).to have_key(:data)
    expect(parsed_data[:data]).to be_an(Hash)
    expect(created_destination.name).to eq(destination_params[:name])
  end

  it "can update an existing destination (UPDATE)" do
    id = @destination1.id
    previous_name = Destination.last.name
    destination_params = { name: "Updated Destination" }
    headers = {"CONTENT_TYPE" => "application/json"}

    # We include this header to make sure that these params are passed as JSON rather than as plain text
    patch "/api/v1/destinations/#{id}", headers: headers, params: JSON.generate(destination_params)

    destination = Destination.find_by(id: id)

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data).to have_key(:data)
    expect(parsed_data[:data]).to be_an(Hash)
    expect(destination.name).to_not eq(previous_name)
    expect(destination.name).to eq("Updated Destination")
  end

  it "can destroy a destination (DESTROY)" do

    expect(Destination.count).to eq(3)

    delete "/api/v1/destinations/#{@destination3.id}"

    expect(response).to be_successful
    expect(Destination.count).to eq(2)
    expect{Destination.find(@destination3.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
