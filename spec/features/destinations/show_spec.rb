# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see the destination's name, zipcode, description, and current weather
# The weather forecast is specific to the destination whose page I'm on
# The forecast should include date (weekday, month and day),
# current, high and low temps in Fahrenheit,
# and a summary (for example "light rain", "clear sky", etc.)

require 'rails_helper'

feature "User can get current weather for destination" do
  it "should include date, current, high and low temps, and a summary" do
    destination = Destination.create(
        name: 'Mountain View',
        zip: '94040',
        description: 'A Town in CA',
        image_url: 'https://dh-prod-cdn.azureedge.net/-/media/property/jdv/avante/downtown-mountain-view-crpd1400x500.jpg?ts=8e91427c-9122-40bc-9fda-c5a32e074a85'
      )

    visit "/"
    click_on("Show")

    expect(current_path).to eq("/destinations/#{destination.id}")
    expect(page).to have_content(destination.name)
    expect(page).to have_content(destination.zip)
    expect(page).to have_content(destination.description)
    expect(page).to have_content("Date:")
    expect(page).to have_content("Current Temperature:")
    expect(page).to have_content("High Temperature:")
    expect(page).to have_content("Low Temperature:")

    within ".weather" do
      expect(page).to have_css('#date')
      expect(page).to have_css('#current-temp')
      expect(page).to have_css('#high-temp')
      expect(page).to have_css('#low-temp')
      expect(page).to have_css('#summary')
      expect(page).to have_css('#weather-image')
    end
  end

  it "I can see an image based on the current weather" do
    destination = Destination.create({name: "Powhatan",
                        zip: "23139",
                        description: "A Beautiful Backwater",
                        image_url: "https://ap.rdcpix.com/2492190932/28685ac41e5e9a8554ba70bfa5449e03l-m1xd-w640_h480_q80.jpg"})

    visit "/destinations/#{destination.id}"

    expect(current_path).to eq(destination_path(destination.id))

    expect(page).to have_css('#weather-image')
  end
end
