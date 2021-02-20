class Wunderground::UploadDataPoint
  include Interactor
  include WundergroundHelper

  delegate :data, to: :context

  def call
    result = if data["type"] == "temp_and_humidity"
      "Uploading #{data_string(data)}"
    else
      "Unrecognized data type: #{data['type']}"
    end
    puts result
  rescue Exception => e
    puts e.message
  end

  private

  def data_string(d)
    "Temp: #{d['temperature']} at #{d['readable_timestamp']}"
  end
end