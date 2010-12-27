# == Schema Info
#
# Table name: comments
#
#  id         :integer(4)      not null, primary key
#  nota_id    :integer(4)
#  user_id    :integer(4)
#  comment    :text
#  created_at :datetime
#  updated_at :datetime

class Comment < ActiveRecord::Base
  belongs_to :nota
  belongs_to :user

  validates :comment, :user_id, :presence => true

  validates_length_of :comment, :within => 3..140
end

