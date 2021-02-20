# == Schema Information
#
# Table name: lacrosse_dumps
#
#  id         :bigint           not null, primary key
#  data       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LacrosseDump < ApplicationRecord
end
