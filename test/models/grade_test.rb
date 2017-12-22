require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  
  @test = Test.new(minimum_grade: 10.0, title: "titulo", date: Date.today, course: Course.create(year:2017))
	@student = students(:one)
  end

  test "Nota aprobada si es mayor a nota minima" do
    grade =  Grade.new(grade:15, student: @student, test: @test)
    @test.grades << grade
		assert @test.grades.first.approved?
	end

  test "Nota aprobada si tiene nota minima" do
    grade =  Grade.new(grade:10.0, student: @student, test: @test)
    @test.grades << grade
  end

  test "Nota cargada sin valor es ausente" do
    grade = Grade.new(student: @student, test: @test)
  	grade.grade=nil
  	grade.save
    assert grade.valid?
		assert @test.grades.first.absent?
		grade.grade=""
		grade.save
		assert @test.grades.first.absent?
		assert_not @test.grades.first.approved?
   end
end
