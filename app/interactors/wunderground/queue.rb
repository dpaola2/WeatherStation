class Wunderground::Queue
  include Interactor

  delegate :cleaned_data, to: :context

  def call
    cleaned_data.map do |data|
      ap data
      UploadDataPointJob.perform_async(data)
    end
  end
end