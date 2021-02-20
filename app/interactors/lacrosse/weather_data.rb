class Lacrosse::WeatherData
  include Interactor
  include LacrosseHelper

  delegate :devices, :token, to: :context

  def call
    context.device_data = map_data(devices)
    context.weather_data_urls = context.device_data.map {|d| url(d) }
    context.weather_data = context.weather_data_urls.map {|weather_url| weather_data_for(weather_url) }
  end

  private

  def map_data(devices)
    devices.map do |device_location|
      device_location[:devices].map do |device|
        device_map(device[:location], device)
      end
    end.flatten
  end

  def url(device)
    "https://ingv2.lacrossetechnology.com/api/v1.1/active-user/device-association/ref.user-device.#{device[:device_id]}/feed?fields=#{device[:sensor_field_names]}&tz=#{tz}&from&to&aggregates=ai.ticks.1&types=spot"
  end

  def weather_data_for(weather_url)
    response = HTTParty.get(
      weather_url,
      headers: {
        "Authorization" => "Bearer #{token}"
      }
    )
    response.parsed_response
  end

  def tz
    "America/Los_Angeles"
  end
end