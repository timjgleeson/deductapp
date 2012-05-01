require 'test_helper'

class DeductionsControllerTest < ActionController::TestCase
  setup do
    @deduction = deductions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deductions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deduction" do
    assert_difference('Deduction.count') do
      post :create, deduction: { amount: @deduction.amount, budget_id: @deduction.budget_id, date: @deduction.date, description: @deduction.description, name: @deduction.name }
    end

    assert_redirected_to deduction_path(assigns(:deduction))
  end

  test "should show deduction" do
    get :show, id: @deduction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deduction
    assert_response :success
  end

  test "should update deduction" do
    put :update, id: @deduction, deduction: { amount: @deduction.amount, budget_id: @deduction.budget_id, date: @deduction.date, description: @deduction.description, name: @deduction.name }
    assert_redirected_to deduction_path(assigns(:deduction))
  end

  test "should destroy deduction" do
    assert_difference('Deduction.count', -1) do
      delete :destroy, id: @deduction
    end

    assert_redirected_to deductions_path
  end
end
