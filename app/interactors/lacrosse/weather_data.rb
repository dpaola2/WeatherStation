class Lacrosse::WeatherData
  include Interactor
  include LacrosseHelper

  delegate :devices, :token, to: :context

  def call
    context.device_data = devices.map do |device_location|
      device_location[:devices].map do |device|
        device_map(device[:location], device)
      end
    end.flatten
  end
end