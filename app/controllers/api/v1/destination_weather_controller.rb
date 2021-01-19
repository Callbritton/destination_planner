class Api::V1::DestinationWeatherController < ApplicationController
  def show
    id = params[:id]
    destination_weather = DestinationWeatherFacade.fetch_destination_weather_data(id)
    render json: DestinationWeatherSerializer.new(destination_weather)
  end
end
