require 'test_helper'

class TypeOfFitsControllerTest < ActionController::TestCase
  setup do
    @type_of_fit = type_of_fits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_of_fits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_of_fit" do
    assert_difference('TypeOfFit.count') do
      post :create, :type_of_fit => @type_of_fit.attributes
    end

    assert_redirected_to type_of_fit_path(assigns(:type_of_fit))
  end

  test "should show type_of_fit" do
    get :show, :id => @type_of_fit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @type_of_fit.to_param
    assert_response :success
  end

  test "should update type_of_fit" do
    put :update, :id => @type_of_fit.to_param, :type_of_fit => @type_of_fit.attributes
    assert_redirected_to type_of_fit_path(assigns(:type_of_fit))
  end

  test "should destroy type_of_fit" do
    assert_difference('TypeOfFit.count', -1) do
      delete :destroy, :id => @type_of_fit.to_param
    end

    assert_redirected_to type_of_fits_path
  end
end
