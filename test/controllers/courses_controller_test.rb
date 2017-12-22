require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @course = courses(:one)
    @course_empty = courses(:empty)

    sign_in users(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should not create course" do
    assert_difference('Course.count', 0) do
      post courses_url, params: { course: { year: @course.year } }
    end

    assert_response :success
    #response?
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { year: @course.year } }
    assert_redirected_to course_url(@course)
  end

  test "should not destroy course" do
    assert_difference('Course.count', 0) do
      delete course_url(@course)
  end

    assert_redirected_to courses_url
  end


  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course_empty)
  end

    assert_redirected_to courses_url
  end
end
