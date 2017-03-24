require 'test_helper'

class DepartmentlessonsControllerTest < ActionController::TestCase
  setup do
    @departmentlesson = departmentlessons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:departmentlessons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create departmentlesson" do
    assert_difference('Departmentlesson.count') do
      post :create, departmentlesson: { departmentlicense_id: @departmentlesson.departmentlicense_id, hour_amount: @departmentlesson.hour_amount, lesson_id: @departmentlesson.lesson_id }
    end

    assert_redirected_to departmentlesson_path(assigns(:departmentlesson))
  end

  test "should show departmentlesson" do
    get :show, id: @departmentlesson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @departmentlesson
    assert_response :success
  end

  test "should update departmentlesson" do
    patch :update, id: @departmentlesson, departmentlesson: { departmentlicense_id: @departmentlesson.departmentlicense_id, hour_amount: @departmentlesson.hour_amount, lesson_id: @departmentlesson.lesson_id }
    assert_redirected_to departmentlesson_path(assigns(:departmentlesson))
  end

  test "should destroy departmentlesson" do
    assert_difference('Departmentlesson.count', -1) do
      delete :destroy, id: @departmentlesson
    end

    assert_redirected_to departmentlessons_path
  end
end
