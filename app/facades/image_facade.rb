class ImageFacade
  def self.fetch_image_data(description)
    image_data = ImageService.image_info(description)
    Image.new(image_data)
  end
end
