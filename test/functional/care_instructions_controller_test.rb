require 'test_helper'

class CareInstructionsControllerTest < ActionController::TestCase
  setup do
    @care_instruction = care_instructions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:care_instructions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create care_instruction" do
    assert_difference('CareInstruction.count') do
      post :create, :care_instruction => @care_instruction.attributes
    end

    assert_redirected_to care_instruction_path(assigns(:care_instruction))
  end

  test "should show care_instruction" do
    get :show, :id => @care_instruction.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @care_instruction.to_param
    assert_response :success
  end

  test "should update care_instruction" do
    put :update, :id => @care_instruction.to_param, :care_instruction => @care_instruction.attributes
    assert_redirected_to care_instruction_path(assigns(:care_instruction))
  end

  test "should destroy care_instruction" do
    assert_difference('CareInstruction.count', -1) do
      delete :destroy, :id => @care_instruction.to_param
    end

    assert_redirected_to care_instructions_path
  end
end
