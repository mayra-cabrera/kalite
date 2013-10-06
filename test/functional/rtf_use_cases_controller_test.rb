require 'test_helper'

class RtfUseCasesControllerTest < ActionController::TestCase
  setup do
    @rtf_use_case = rtf_use_cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rtf_use_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rtf_use_case" do
    assert_difference('RtfUseCase.count') do
      post :create, rtf_use_case: @rtf_use_case.attributes
    end

    assert_redirected_to rtf_use_case_path(assigns(:rtf_use_case))
  end

  test "should show rtf_use_case" do
    get :show, id: @rtf_use_case.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rtf_use_case.to_param
    assert_response :success
  end

  test "should update rtf_use_case" do
    put :update, id: @rtf_use_case.to_param, rtf_use_case: @rtf_use_case.attributes
    assert_redirected_to rtf_use_case_path(assigns(:rtf_use_case))
  end

  test "should destroy rtf_use_case" do
    assert_difference('RtfUseCase.count', -1) do
      delete :destroy, id: @rtf_use_case.to_param
    end

    assert_redirected_to rtf_use_cases_path
  end
end
