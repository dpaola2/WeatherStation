class Wunderground::UploadDataPoint
  include Interactor
  include WundergroundHelper

  delegate :data, to: :context

  def call
    result = if data["type"] == "temp_and_humidity"
      wunderground_request = WundergroundRequest.create!(
        url: upload_url,
        payload: payload
      )

      context.response = HTTParty.get(
        upload_url,
        query: payload
      )
      wunderground_request.update(response: context.response.parsed_response)
    else
      "Unrecognized data type: #{data['type']}"
    end
  end

  private

  def upload_url
    "http://rtupdate.wunderground.com/weatherstation/updateweatherstation.php"
  end

  def data_string(d)
    "Temp: #{d['temperature']} at #{d['readable_timestamp']}"
  end

  def payload
    {
      'action' => 'updateraw',
      'dateutc' => data["readable_timestamp"],
      'ID' => station_id,
      'PASSWORD' => station_key,
      'realtime' => 1,
      'rtfreq' => 2.5
    }.merge(custom_payload)
  end

  def custom_payload
    {
      'tempf' => data['temperature'],
      'humidity' => data['humidity']
    }
  end
end