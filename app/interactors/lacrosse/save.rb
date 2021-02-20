class Lacrosse::Save
  include Interactor

  delegate :weather_data, to: :context

  def call
    WeatherData.create!(data: weather_data)
  end
end