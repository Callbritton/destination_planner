require 'rails_helper'

describe ImageFacade do
  context ".fetch_image_data" do
    it "returns the image data for a given description" do
      data = ImageFacade.fetch_image_data("cloudy")

      expect(data).to be_a(Image)
      expect(data.url).to be_a(String)
    end
  end
end
