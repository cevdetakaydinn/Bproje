require 'test_helper'

class DepartmentlicensesControllerTest < ActionController::TestCase
  setup do
    @departmentlicense = departmentlicenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:departmentlicenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create departmentlicense" do
    assert_difference('Departmentlicense.count') do
      post :create, departmentlicense: { department_id: @departmentlicense.department_id, has_night: @departmentlicense.has_night, license_id: @departmentlicense.license_id, year: @departmentlicense.year }
    end

    assert_redirected_to departmentlicense_path(assigns(:departmentlicense))
  end

  test "should show departmentlicense" do
    get :show, id: @departmentlicense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @departmentlicense
    assert_response :success
  end

  test "should update departmentlicense" do
    patch :update, id: @departmentlicense, departmentlicense: { department_id: @departmentlicense.department_id, has_night: @departmentlicense.has_night, license_id: @departmentlicense.license_id, year: @departmentlicense.year }
    assert_redirected_to departmentlicense_path(assigns(:departmentlicense))
  end

  test "should destroy departmentlicense" do
    assert_difference('Departmentlicense.count', -1) do
      delete :destroy, id: @departmentlicense
    end

    assert_redirected_to departmentlicenses_path
  end
end
