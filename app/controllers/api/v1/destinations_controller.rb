class Api::V1::DestinationsController < ApplicationController
  def index
    render json: DestinationSerializer.new(Destination.all)
  end

  def show
    render json: DestinationSerializer.new(Destination.find(params[:id]))
  end

  def create
    render json: DestinationSerializer.new(Destination.create(destination_params))
  end

  def update
    render json: DestinationSerializer.new(Destination.update(params[:id], destination_params))
  end

  def destroy
    Destination.destroy(params[:id])
  end

  private

  def destination_params
    params.permit(:id, :name, :zip, :description, :image_url)
  end
end
