require 'test_helper'

class Management::AdministratorsControllerTest < ActionController::TestCase
  setup do
    @management_administrator = management_administrators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:management_administrators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create management_administrator" do
    assert_difference('Management::Administrator.count') do
      post :create, management_administrator: @management_administrator.attributes
    end

    assert_redirected_to management_administrator_path(assigns(:management_administrator))
  end

  test "should show management_administrator" do
    get :show, id: @management_administrator.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @management_administrator.to_param
    assert_response :success
  end

  test "should update management_administrator" do
    put :update, id: @management_administrator.to_param, management_administrator: @management_administrator.attributes
    assert_redirected_to management_administrator_path(assigns(:management_administrator))
  end

  test "should destroy management_administrator" do
    assert_difference('Management::Administrator.count', -1) do
      delete :destroy, id: @management_administrator.to_param
    end

    assert_redirected_to management_administrators_path
  end
end
