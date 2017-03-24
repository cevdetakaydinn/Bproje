require 'test_helper'

class AcademictermsControllerTest < ActionController::TestCase
  setup do
    @academicterm = academicterms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:academicterms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create academicterm" do
    assert_difference('Academicterm.count') do
      post :create, academicterm: { term: @academicterm.term, year: @academicterm.year }
    end

    assert_redirected_to academicterm_path(assigns(:academicterm))
  end

  test "should show academicterm" do
    get :show, id: @academicterm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @academicterm
    assert_response :success
  end

  test "should update academicterm" do
    patch :update, id: @academicterm, academicterm: { term: @academicterm.term, year: @academicterm.year }
    assert_redirected_to academicterm_path(assigns(:academicterm))
  end

  test "should destroy academicterm" do
    assert_difference('Academicterm.count', -1) do
      delete :destroy, id: @academicterm
    end

    assert_redirected_to academicterms_path
  end
end
