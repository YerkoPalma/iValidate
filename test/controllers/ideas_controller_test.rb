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
    get :index
    assert_response :success
    assert_not_includes @response["Content-Type"], "application/json"
  end

  test 'should get index.json' do
    get :index, {format: :json}
    assert_response :success
    assert_includes @response["Content-Type"], "application/json"
    assert_not_nil assigns(:ideas)
  end

  test "should create user with json format" do
    assert_difference('Idea.count') do
      # can not pass the Idea object. Need to pass a hash,
      # so it would be better to create a function in test_helper
      # that takes a model object and return a hash (for ideas and canvas)
      post :create, { idea: @easycount, format: :json }
      assert_includes @response["Content-Type"], "application/json"
    end
  end

  test 'should get show.json' do
    get :show, { id: @easycount.name, format: :json}
    assert_response :success
    assert_includes @response["Content-Type"], "application/json"
  end

  test 'should not get show.html' do
  end
end
