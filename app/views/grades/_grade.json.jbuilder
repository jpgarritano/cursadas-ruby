json.extract! grade, :id, :grade, :student_id, :test_id, :created_at, :updated_at
json.url course_test_grade_url(grade.test.course,grade.test, grade, format: :json)
