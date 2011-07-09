require 'test_helper'

class AddressRangesControllerTest < ActionController::TestCase
  setup do
    @address_range = address_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:address_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address_range" do
    assert_difference('AddressRange.count') do
      post :create, :address_range => @address_range.attributes
    end

    assert_redirected_to address_range_path(assigns(:address_range))
  end

  test "should show address_range" do
    get :show, :id => @address_range.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @address_range.to_param
    assert_response :success
  end

  test "should update address_range" do
    put :update, :id => @address_range.to_param, :address_range => @address_range.attributes
    assert_redirected_to address_range_path(assigns(:address_range))
  end

  test "should destroy address_range" do
    assert_difference('AddressRange.count', -1) do
      delete :destroy, :id => @address_range.to_param
    end

    assert_redirected_to address_ranges_path
  end
end
