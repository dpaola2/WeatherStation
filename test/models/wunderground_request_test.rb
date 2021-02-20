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
require "test_helper"

class WundergroundRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
