class Wunderground::LatestTimestamp
  include Interactor

  def call
    url = "https://api.weather.com/v2/pws/observations/current?stationId=#{station_id}&format=json&units=e&apiKey=#{api_key}"
    request = WundergroundRequest.create!(url: url)

    context.url = url
    context.response = HTTParty.get(url)

    requeset.update(response: context.response.parsed_response)

  end

  def station_id
    ENV['WUNDERGROUND_STATION_ID']
  end

  def api_key
    ENV['WUNDERGROUND_API_KEY']
  end
end