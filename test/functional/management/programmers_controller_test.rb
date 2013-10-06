require 'test_helper'

class Management::ProgrammersControllerTest < ActionController::TestCase
  setup do
    @management_programmer = management_programmers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:management_programmers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create management_programmer" do
    assert_difference('Management::Programmer.count') do
      post :create, management_programmer: @management_programmer.attributes
    end

    assert_redirected_to management_programmer_path(assigns(:management_programmer))
  end

  test "should show management_programmer" do
    get :show, id: @management_programmer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @management_programmer.to_param
    assert_response :success
  end

  test "should update management_programmer" do
    put :update, id: @management_programmer.to_param, management_programmer: @management_programmer.attributes
    assert_redirected_to management_programmer_path(assigns(:management_programmer))
  end

  test "should destroy management_programmer" do
    assert_difference('Management::Programmer.count', -1) do
      delete :destroy, id: @management_programmer.to_param
    end

    assert_redirected_to management_programmers_path
  end
end
