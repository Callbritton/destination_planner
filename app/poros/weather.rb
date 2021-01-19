class Weather
  attr_reader :date,
              :current_temp,
              :high_temp,
              :low_temp,
              :summary

  def initialize(data)
    # @date = Time.now.strftime("%A, %B %e")
    @date = Time.at(data[:dt]).strftime("%A, %B %e")
    @current_temp = data[:main][:temp]
    @high_temp = data[:main][:temp_max]
    @low_temp = data[:main][:temp_min]
    @summary = data[:weather].first[:description]
  end
end
