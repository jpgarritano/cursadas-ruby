require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

  setup do
    @grade= grades(:one)
    sign_in users(:one)

  end

  test "should get index" do
    get course_test_grades_url(@grade.test.course, @grade.test,@grade)
    assert_response :success
  end

  test "should get new" do
    get new_course_test_grade_url(@grade.test.course, @grade.test,@grade)
    assert_response :success
  end

  test "should create course_test_grade" do
    assert_difference('Grade.count') do
      post course_test_grades_url(@grade.test.course, @grade.test), params: { grade: { grade: 10 , student: @grade.student, test: @grade.test } }
    end
    course_test_grades_url(@grade.test.course, @grade.test)
  end

  test "should show course_test_grade" do
    get course_test_grade_url(@grade.test.course, @grade.test,@grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_test_grade_url(@grade.test.course, @grade.test,@grade)
    assert_response :success
  end

  test "should update course_test_grade" do
    patch course_test_grade_url(@grade.test.course, @grade.test,@grade), params: { grade: { grade: 10 } }
    assert_redirected_to course_test_grades_url(@grade.test.course, @grade.test)
  end

  test "should destroy course_test_grade" do
    assert_difference('Grade.count', -1) do
      delete course_test_grade_url(@grade.test.course, @grade.test,@grade)
    end

    assert_redirected_to course_test_grades_url(@grade.test.course, @grade.test)
  end
end
