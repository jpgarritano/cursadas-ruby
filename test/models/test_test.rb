require 'test_helper'

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "evaluacion con valores esperados" do
	  t = Test.new(minimum_grade: 10.0, title: "titulo", date: Date.today)
	  t.course = @Course.create(year:2017)
	  t.save
	  assert t.valid?
	end

	test "no permite crear evaluacion sin titulo" do
	  t = Test.new(minimum_grade: 10.0, title: "", date: Date.today)
	  t.course = @Course.create(year:2017)
	  t.save
	  assert_not t.valid?
	end

	test "mantiene valor flotante de nota" do
	  t = Test.new(minimum_grade: 9.5, title: "titulo", date: Date.today)
	  t.course = @Course.create(year:2017)
	  assert_equal t.minimum_grade,9.5
    end

    test "solo una nota por estudiante" do
    	
    end
end
