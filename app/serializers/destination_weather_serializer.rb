class DestinationWeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date,
             :id,
             :current_temp,
             :high_temp,
             :low_temp,
             :summary,
             :name,
             :zip,
             :image
end
