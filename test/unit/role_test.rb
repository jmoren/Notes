# == Schema Info
#
# Table name: roles
#
#  id                :integer(4)      not null, primary key
#  authorizable_id   :integer(4)
#  authorizable_type :string(40)
#  name              :string(40)
#  created_at        :datetime
#  updated_at        :datetime

require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
