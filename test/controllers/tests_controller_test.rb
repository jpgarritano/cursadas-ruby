require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
   include Devise::Test::IntegrationHelpers
  setup do
    @test = tests(:one)
    @test_empty = tests(:empty)
    sign_in users(:one)

  end

  test "should get index" do
    get course_tests_url(@test.course)
    assert_response :success
  end

  test "should get new" do
    get new_course_test_url(@test.course)
    assert_response :success
  end

  test "should create test" do
    assert_difference('Test.count') do
      post course_tests_url(@test.course,@test), params: { test: { course_id: @test.course_id, date: @test.date, minimum_grade: @test.minimum_grade, title: @test.title } }
    end
    assert_redirected_to course_tests_url(Test.last.course_id)
  end

  #test "should show test" do
  #  get course_test_url(@test.course,@test)
  #  assert_response :success
  #end

  test "should get edit" do
    get edit_course_test_url(@test.course,@test)
    assert_response :success
  end

  test "should update test" do
    patch course_test_url(@test.course, @test), params: { test: { course_id: @test.course_id, date: @test.date, minimum_grade: @test.minimum_grade, title: @test.title } }
    assert_redirected_to course_tests_url(@test.course)
  end

  test "should destroy test" do
    assert_difference('Test.count', -1) do
      delete course_test_url(@test_empty.course,@test_empty)
    end

    assert_redirected_to course_tests_url
  end
end
