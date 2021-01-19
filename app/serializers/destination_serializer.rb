class DestinationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :zip, :description, :image_url
end
