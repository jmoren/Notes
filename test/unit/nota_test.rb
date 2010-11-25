require 'test_helper'

class NotaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Nota.new.valid?
  end
end
