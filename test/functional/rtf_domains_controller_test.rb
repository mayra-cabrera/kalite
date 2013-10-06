require 'test_helper'

class RtfDomainsControllerTest < ActionController::TestCase
  setup do
    @rtf_domain = rtf_domains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rtf_domains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rtf_domain" do
    assert_difference('RtfDomain.count') do
      post :create, rtf_domain: @rtf_domain.attributes
    end

    assert_redirected_to rtf_domain_path(assigns(:rtf_domain))
  end

  test "should show rtf_domain" do
    get :show, id: @rtf_domain.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rtf_domain.to_param
    assert_response :success
  end

  test "should update rtf_domain" do
    put :update, id: @rtf_domain.to_param, rtf_domain: @rtf_domain.attributes
    assert_redirected_to rtf_domain_path(assigns(:rtf_domain))
  end

  test "should destroy rtf_domain" do
    assert_difference('RtfDomain.count', -1) do
      delete :destroy, id: @rtf_domain.to_param
    end

    assert_redirected_to rtf_domains_path
  end
end
