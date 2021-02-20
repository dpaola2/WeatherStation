# == Schema Information
#
# Table name: lacrosse_dumps
#
#  id         :bigint           not null, primary key
#  data       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class LacrosseDumpTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
