require 'test_helper'

class DomainMappingsControllerTest < ActionController::TestCase
  setup do
    @domain_mapping = domain_mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:domain_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create domain_mapping" do
    assert_difference('DomainMapping.count') do
      post :create, :domain_mapping => @domain_mapping.attributes
    end

    assert_redirected_to domain_mapping_path(assigns(:domain_mapping))
  end

  test "should show domain_mapping" do
    get :show, :id => @domain_mapping.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @domain_mapping.to_param
    assert_response :success
  end

  test "should update domain_mapping" do
    put :update, :id => @domain_mapping.to_param, :domain_mapping => @domain_mapping.attributes
    assert_redirected_to domain_mapping_path(assigns(:domain_mapping))
  end

  test "should destroy domain_mapping" do
    assert_difference('DomainMapping.count', -1) do
      delete :destroy, :id => @domain_mapping.to_param
    end

    assert_redirected_to domain_mappings_path
  end
end
