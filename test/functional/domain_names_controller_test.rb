require 'test_helper'

class DomainNamesControllerTest < ActionController::TestCase
  setup do
    @domain_name = domain_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:domain_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create domain_name" do
    assert_difference('DomainName.count') do
      post :create, :domain_name => @domain_name.attributes
    end

    assert_redirected_to domain_name_path(assigns(:domain_name))
  end

  test "should show domain_name" do
    get :show, :id => @domain_name.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @domain_name.to_param
    assert_response :success
  end

  test "should update domain_name" do
    put :update, :id => @domain_name.to_param, :domain_name => @domain_name.attributes
    assert_redirected_to domain_name_path(assigns(:domain_name))
  end

  test "should destroy domain_name" do
    assert_difference('DomainName.count', -1) do
      delete :destroy, :id => @domain_name.to_param
    end

    assert_redirected_to domain_names_path
  end
end
