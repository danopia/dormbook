require 'test_helper'

class ZebrasControllerTest < ActionController::TestCase
  setup do
    @zebra = zebras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zebras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zebra" do
    assert_difference('Zebra.count') do
      post :create, :zebra => @zebra.attributes
    end

    assert_redirected_to zebra_path(assigns(:zebra))
  end

  test "should show zebra" do
    get :show, :id => @zebra.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @zebra.to_param
    assert_response :success
  end

  test "should update zebra" do
    put :update, :id => @zebra.to_param, :zebra => @zebra.attributes
    assert_redirected_to zebra_path(assigns(:zebra))
  end

  test "should destroy zebra" do
    assert_difference('Zebra.count', -1) do
      delete :destroy, :id => @zebra.to_param
    end

    assert_redirected_to zebras_path
  end
end
