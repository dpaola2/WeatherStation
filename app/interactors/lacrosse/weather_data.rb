class Lacrosse::WeatherData
  include Interactor
  include LacrosseHelper

  delegate :devices, :token, to: :context

  def call
    context.device_data = map_data(devices)
    context.weather_data = context.device_data.map {|d| weather_data_for(d) }
  end

  private

  def map_data(devices)
    devices.map do |device_location|
      device_location[:devices].map do |device|
        device_map(device[:location], device)
      end
    end.flatten.reject do |d|
      d[:device_name] == "indoor" 
    end
  end

  def url(device)
    "https://ingv2.lacrossetechnology.com/api/v1.1/active-user/device-association/ref.user-device.#{device[:device_id]}/feed?fields=#{device[:sensor_field_names]}&tz=#{tz}&from=#{from}&to=#{to}&aggregates=ai.ticks.1&types=spot"
  end

  def weather_data_for(device)
    weather_url = url(device)

    response = HTTParty.get(
      weather_url,
      headers: {
        "Authorization" => "Bearer #{token}"
      }
    )
    response.parsed_response["ref.user-device.#{device[:device_id]}"]["ai.ticks.1"]["fields"]
  end

  def tz
    "America/Los_Angeles"
  end

  def from
    (Time.current - 15.minutes).utc.to_i
  end

  def to
    Time.current.utc.to_i
  end
end