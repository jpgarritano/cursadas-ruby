require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Deberia tener el año definido" do
  	course = Course.new
  	assert_not course.save, "Se guardo un curso sin año definido"
  end

  test "Cursada valida" do
  	course = Course.new(year: 2019)
  	assert course.valid?
  end

  test "No debe borrar una cursada con examenes relacionados" do
  	course = Course.new
  	course.year = Date.today.year
  	course.tests << tests(:one)
    assert_raises (ActiveRecord::DeleteRestrictionError) do
  	   course.destroy
    end
  	#assert_not course.destroyed?
  end

  
end
