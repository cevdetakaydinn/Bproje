require 'test_helper'

class LessonhoursControllerTest < ActionController::TestCase
  setup do
    @lessonhour = lessonhours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lessonhours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lessonhour" do
    assert_difference('Lessonhour.count') do
      post :create, lessonhour: { beginning: @lessonhour.beginning, ending: @lessonhour.ending }
    end

    assert_redirected_to lessonhour_path(assigns(:lessonhour))
  end

  test "should show lessonhour" do
    get :show, id: @lessonhour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lessonhour
    assert_response :success
  end

  test "should update lessonhour" do
    patch :update, id: @lessonhour, lessonhour: { beginning: @lessonhour.beginning, ending: @lessonhour.ending }
    assert_redirected_to lessonhour_path(assigns(:lessonhour))
  end

  test "should destroy lessonhour" do
    assert_difference('Lessonhour.count', -1) do
      delete :destroy, id: @lessonhour
    end

    assert_redirected_to lessonhours_path
  end
end
