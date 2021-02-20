# == Schema Information
#
# Table name: wunderground_requests
#
#  id         :bigint           not null, primary key
#  response   :jsonb
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class WundergroundRequest < ApplicationRecord
end
