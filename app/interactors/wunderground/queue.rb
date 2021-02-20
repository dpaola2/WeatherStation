class Wunderground::Queue
  include Interactor

  delegate :cleaned_data, to: :context

  def call
    context.result = cleaned_data.map do |data|
      result = Wunderground::UploadDataPoint.call(data: data)
      if result.success?
        result.result
      else
        "error"
      end
    end
  end
end