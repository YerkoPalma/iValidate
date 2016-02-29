require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  def setup
    @easycount = build(:easycount)
    # @easycount.save
    @fixar = build(:fixar)
    # @fixar.save
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
      post :create, { idea: Hash[@easycount.attributes], format: :json }
      assert_includes @response["Content-Type"], "application/json"
      assert_response :created
    end
  end

  test 'should get show.json' do
    # ensure that the idea is created on db
    post :create, { idea: Hash[@easycount.attributes], format: :json }
    get :show, { id: @easycount.name, format: :json}
    assert_response :success
    assert_includes @response["Content-Type"], "application/json"
  end

  test 'should not get show.html' do
    # ensure that the idea is created on db
    post :create, { idea: Hash[@easycount.attributes], format: :json }
    assert_raises ActionController::UnknownFormat do
      get :show, id: @easycount.name
    end
  end

  test 'should create embeded canvas model' do
    # ensure that the idea is created on db
    post :create, { idea: Hash[@easycount.attributes], format: :json }
    post :model, {id: @easycount.name, canvas: Hash[build(:easycount_canvas).attributes], format: :json}
    # check if the model was saved correctly
    easycount_model = Idea.find(@easycount.name)
    assert_not_nil easycount_model.canvas
    assert easycount_model.canvas.valid?
    assert_includes @response["Content-Type"], "application/json"
    assert_response :created
  end
end
