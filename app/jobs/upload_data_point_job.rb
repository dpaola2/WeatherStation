class UploadDataPointJob
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_throttle({
    :threshold => { :limit => 1, :period => 3.seconds }
  })

  def perform(options)
    Wunderground::UploadDataPoint.call(data: options)
  end
end