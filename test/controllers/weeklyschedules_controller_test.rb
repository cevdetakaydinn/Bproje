require 'test_helper'

class WeeklyschedulesControllerTest < ActionController::TestCase
  setup do
    @weeklyschedule = weeklyschedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weeklyschedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weeklyschedule" do
    assert_difference('Weeklyschedule.count') do
      post :create, weeklyschedule: { classroom_id: @weeklyschedule.classroom_id, curriculum_id: @weeklyschedule.curriculum_id, day_id: @weeklyschedule.day_id, lessonhours_id: @weeklyschedule.lessonhours_id }
    end

    assert_redirected_to weeklyschedule_path(assigns(:weeklyschedule))
  end

  test "should show weeklyschedule" do
    get :show, id: @weeklyschedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weeklyschedule
    assert_response :success
  end

  test "should update weeklyschedule" do
    patch :update, id: @weeklyschedule, weeklyschedule: { classroom_id: @weeklyschedule.classroom_id, curriculum_id: @weeklyschedule.curriculum_id, day_id: @weeklyschedule.day_id, lessonhours_id: @weeklyschedule.lessonhours_id }
    assert_redirected_to weeklyschedule_path(assigns(:weeklyschedule))
  end

  test "should destroy weeklyschedule" do
    assert_difference('Weeklyschedule.count', -1) do
      delete :destroy, id: @weeklyschedule
    end

    assert_redirected_to weeklyschedules_path
  end
end
