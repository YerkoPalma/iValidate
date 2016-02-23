require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  def setup
    # to prevent duplicate email
    Idea.delete_all
    @easycount = build(:easycount)
  end
  
  test "should be valid" do
    assert @easycount.valid?, @easycount.errors.full_messages[0]
  end
end
