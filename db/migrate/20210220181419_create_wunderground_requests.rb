class CreateWundergroundRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :wunderground_requests do |t|
      t.string :url
      t.jsonb :response

      t.timestamps
    end
  end
end
