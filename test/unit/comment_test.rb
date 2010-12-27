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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Comment.new.valid?
  end
end
