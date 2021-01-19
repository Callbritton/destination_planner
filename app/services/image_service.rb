class ImageService

  def self.image_info(weather_description)
    response = conn.get("/v1/gifs/search?q=#{weather_description}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.giphy.com") do |faraday|
      faraday.params["api_key"] = ENV["GIPHY_API_KEY"]
    end
  end
end
