module WundergroundHelper
  def station_id
    ENV['WUNDERGROUND_STATION_ID']
  end

  def station_key
    ENV['WUNDERGROUND_STATION_KEY']
  end

  def api_key
    ENV['WUNDERGROUND_API_KEY']
  end

  def celsius_to_fahrenheit(celsius)
    celsius * 9 / 5 + 32
  end

  def kilometers_to_miles(km)
    km * 1.60934
  end
end