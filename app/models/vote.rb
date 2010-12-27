# == Schema Info
#
# Table name: votes
#
#  id         :integer(4)      not null, primary key
#  nota_id    :integer(4)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :nota
end
