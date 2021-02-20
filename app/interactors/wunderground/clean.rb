class Wunderground::Clean
  include Interactor
  include WundergroundHelper

  delegate :weather_data, to: :context

  def call
    context.cleaned_data = weather_data.map do |data|
      # Might have the following keys:
      # ["Temperature", "Humidity", "HeatIndex"]
      # ["WindSpeed"]
      # ["Rain"]

      if data.keys.include?("Temperature") && data.keys.include?("Humidity")
        data["Temperature"]["values"].zip(data["Humidity"]["values"]).map do |tuple|
          {
            type: :temp_and_humidity,
            readable_timestamp: Time.at(tuple.first["u"]).strftime('%Y-%m-%d %H:%M:%S'),
            utc_timestamp: tuple.first["u"],
            temperature: celsius_to_fahrenheit(tuple.first["s"]),
            humidity: tuple.second["s"]
          }
        end
      elsif data.keys.include? "HeatIndex"
        []
      elsif data.keys.include? "WindSpeed"
        []
      elsif data.keys.include? "Rain"
        []
      end
    end.flatten.compact
  end
end