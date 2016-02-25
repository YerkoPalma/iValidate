require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  def setup
    @easycount = build(:easycount)
    @easycount.save
    @fixar = build(:fixar)
    @fixar.save
  end

  def teardown
    Idea.delete_all
  end

  test 'should get index.html' do

  end

  test 'should get index.json' do
    get :index, {format: :json}
    assert_response :success
    assert_includes @response["Content-Type"], "application/json"
    assert_not_nil assigns(:ideas)
  end

  test 'should get show.json' do
  end

  test 'should not get show.html' do
  end
end
