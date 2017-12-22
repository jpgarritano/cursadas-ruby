require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
 def setup
 	@student = Student.create(name:"String",lastname:"String",legajo:"String",doc:"String",email:"String@string.com")
 	@course1 = Course.create(year:2017)
 	@course2 = Course.create(year:2018)
 end

 test "el estudiante inicializa sin cursadas relacionadas" do
 	assert_equal 0,@student.courses.count
  end


 test "el estudiante posee y conoce sus cursadas (1 o mas de una)" do
	@student.courses.push(@course1)
	assert_equal 1,@student.courses.count
 	@student.courses.push(@course2)
 	assert_equal 2,@student.courses.count
 end
 test "el estudiante aprueba"  do
 	@student.courses.push(@course1)
 	t = Test.new(minimum_grade: 10.0, title: "titulo", date: Date.today)
	t.course = @course1
	grade =  Grade.new(grade:15, student: @student, test: @test)
    t.grades << grade
    @student.grades do |g|
    	assert g.approved?
    end
 end
end
