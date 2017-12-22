class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :test

  validates :student, uniqueness: { scope: :test, message: "Una sola nota por estudiante" }  


  def approved?
	grade >= test.minimum_grade unless absent?
  end

  def absent?
	grade.blank?
  end


  def studentsForNewGrade
  	r = []
	students = test.course.students
	students.each do |s|
		gr = Grade.where(student_id: s.id).where(test_id: test.id)
		r << s if gr.blank?
	end
	r
  end	
end