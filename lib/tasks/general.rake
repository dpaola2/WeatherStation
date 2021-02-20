task retrieve_and_upload: :environment do
  result = Lacrosse::Retrieve.call
  Wunderground::Upload.call(weather_data: result.weather_data)
end