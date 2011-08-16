require 'test_helper'

class RoomiesControllerTest < ActionController::TestCase
  setup do
    @roomy = roomies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roomies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roomy" do
    assert_difference('Roomie.count') do
      post :create, :roomy => @roomy.attributes
    end

    assert_redirected_to roomy_path(assigns(:roomy))
  end

  test "should show roomy" do
    get :show, :id => @roomy.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @roomy.to_param
    assert_response :success
  end

  test "should update roomy" do
    put :update, :id => @roomy.to_param, :roomy => @roomy.attributes
    assert_redirected_to roomy_path(assigns(:roomy))
  end

  test "should destroy roomy" do
    assert_difference('Roomie.count', -1) do
      delete :destroy, :id => @roomy.to_param
    end

    assert_redirected_to roomies_path
  end
end
