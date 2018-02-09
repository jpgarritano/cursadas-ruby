require 'test_helper'

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "evaluacion con valores esperados" do
	  t = Test.new(minimum_grade: 10.0, title: "titulo", date: Date.today)
	  t.course = Course.create(year:2017)
	  t.save
	  assert t.valid?
	end

	test "no permite crear evaluacion sin titulo" do
	  t = Test.new(minimum_grade: 10.0, title: "", date: Date.today)
	  t.course = Course.create(year:2017)
	  t.save
	  assert_not t.valid?
	end

	test "mantiene valor flotante de nota" do
	  t = Test.new(minimum_grade: 9.5, title: "titulo", date: Date.today)
	  t.course = Course.create(year:2017)
	  assert_equal t.minimum_grade,9.5
    end

    test "solo una nota por estudiante" do
    	t = Test.new(minimum_grade: 9.5, title: "titulo", date: Date.today)
    	t.course = Course.create(year:2017)
    	t.save
    	student = Student.create(name:"String",lastname:"String",legajo:"String",doc:"String",email:"String@string.com")
		grade = Grade.create(grade:10, student:student,test: t)
		grade.save
		total=Grade.all.count
		grade2= Grade.create(grade:9, student:student,test: t)	
		total2=Grade.all.count
		assert_equal total,total2
    end

    test "Se borra evaluacion con sus notas" do
    	t = Test.new(minimum_grade: 4, title: "titulo", date: Date.today)
    	t.course = Course.create(year:2017)
    	t.save
    	student = Student.create(name:"String",lastname:"String",legajo:"String",doc:"String",email:"String@string.com")
		grade = Grade.create(grade:10, student:student,test: t)
		grade.save
		total=Grade.all.count
		t.destroy
		total2=Grade.all.count
		#total2 deberia tener una nota menos ya que se borro su evaluacion
		assert_equal total-1,total2
    end
end
