require 'test_helper'

class CanvasTest < ActiveSupport::TestCase
  def setup
    # to prevent duplicate email
    Canvas.delete_all
    @easycount_canvas = build(:easycount_canvas)
  end

  test 'should be valid' do
    assert @easycount_canvas.valid?, @easycount_canvas.errors.full_messages[0]
  end
end
