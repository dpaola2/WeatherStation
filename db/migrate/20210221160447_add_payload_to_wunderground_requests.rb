class AddPayloadToWundergroundRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :wunderground_requests, :payload, :jsonb
  end
end
