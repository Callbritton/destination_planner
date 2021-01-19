class Image
  attr_reader :url

  def initialize(image_data)
    @url = image_data[:data][0][:images][:original][:url]
  end
end
