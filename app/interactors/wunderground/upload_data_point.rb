class Wunderground::UploadDataPoint
  include Interactor
  include WundergroundHelper

  delegate :data, to: :context

  def call
    context.result = if data[:type] == :temp_and_humidity
      "Uploading #{data_string(data)}"
    else
      "Unrecognized data type: #{data[:type]}"
    end

  end

  private

  def data_string(d)
    "Temp: #{d[:temperature]} at #{d[:utc_timestamp]}"
  end
end