require 'rails_helper'

describe ImageService do
  context ".image_info" do
    it "returns image information for a given description" do
      image_service = ImageService.image_info("cloudy")

      expect(image_service).to be_a(Hash)
      expect(image_service[:data][0][:images][:original][:url]).to be_a(String)
    end
  end
end
