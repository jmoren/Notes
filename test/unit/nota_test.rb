# == Schema Info
#
# Table name: notas
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)
#  topic_id    :integer(4)
#  user_id     :integer(4)
#  body        :text
#  title       :string(255)
#  views       :integer(4)      default(0)
#  vote        :integer(4)      default(0)
#  created_at  :datetime
#  updated_at  :datetime

require 'test_helper'

class NotaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Nota.new.valid?
  end
end
