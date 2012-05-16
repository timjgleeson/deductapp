require 'test_helper'

class AdditionsControllerTest < ActionController::TestCase
  setup do
    @addition = additions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:additions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create addition" do
    assert_difference('Addition.count') do
      post :create, addition: { amount: @addition.amount, budget_id: @addition.budget_id, description: @addition.description, name: @addition.name, user_id: @addition.user_id }
    end

    assert_redirected_to addition_path(assigns(:addition))
  end

  test "should show addition" do
    get :show, id: @addition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @addition
    assert_response :success
  end

  test "should update addition" do
    put :update, id: @addition, addition: { amount: @addition.amount, budget_id: @addition.budget_id, description: @addition.description, name: @addition.name, user_id: @addition.user_id }
    assert_redirected_to addition_path(assigns(:addition))
  end

  test "should destroy addition" do
    assert_difference('Addition.count', -1) do
      delete :destroy, id: @addition
    end

    assert_redirected_to additions_path
  end
end
