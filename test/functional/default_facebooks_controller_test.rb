require 'test_helper'

class DefaultFacebooksControllerTest < ActionController::TestCase
  setup do
    @default_facebook = default_facebooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:default_facebooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create default_facebook" do
    assert_difference('DefaultFacebook.count') do
      post :create, default_facebook: { admins: @default_facebook.admins, description: @default_facebook.description, image_url: @default_facebook.image_url, site_name: @default_facebook.site_name, site_type: @default_facebook.site_type, title: @default_facebook.title, url: @default_facebook.url }
    end

    assert_redirected_to default_facebook_path(assigns(:default_facebook))
  end

  test "should show default_facebook" do
    get :show, id: @default_facebook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @default_facebook
    assert_response :success
  end

  test "should update default_facebook" do
    put :update, id: @default_facebook, default_facebook: { admins: @default_facebook.admins, description: @default_facebook.description, image_url: @default_facebook.image_url, site_name: @default_facebook.site_name, site_type: @default_facebook.site_type, title: @default_facebook.title, url: @default_facebook.url }
    assert_redirected_to default_facebook_path(assigns(:default_facebook))
  end

  test "should destroy default_facebook" do
    assert_difference('DefaultFacebook.count', -1) do
      delete :destroy, id: @default_facebook
    end

    assert_redirected_to default_facebooks_path
  end
end
