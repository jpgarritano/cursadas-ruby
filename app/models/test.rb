class Test < ApplicationRecord
  belongs_to :course
  has_many :grades ,dependent: :restrict_with_exception
  accepts_nested_attributes_for :grades

  validates :minimum_grade, presence: true
  validates :date, presence: true
  validates :title, presence: true
  validates :course, presence: true
  


  def approvedAmount
  	Test.joins(:grades).where("id" => id).where("grade >= ?", minimum_grade).count
  end

  def disapprovedAmount
  	Test.joins(:grades).where("id" => id).where("grade < ?", minimum_grade).count
  end

  def absentAmount
  	  	Test.joins(:grades).where("id" => id).where("grade IS NULL").count
  end

  def genericPercentage aMount
     #segun Trabajo Practico el porcentaje se calcula por sobre el numero de presentes
     #En la correccion quedo marcado que el porcentaje tambien debe contemplar a los ausentes
     totalGrades = Grade.where("test_id" => id).count
     app = approvedAmount
     disapp = disapprovedAmount
     abs = absentAmount
     if ((app+disapp+abs)>0)
       (100 *  aMount)  / (app+disapp+abs)
     else 0
     end

  end
  def approvedPercentage
  	 genericPercentage (approvedAmount)
  end

  def disapprovedPercentage
    genericPercentage (disapprovedAmount)
  end

  def absentPercentage
     genericPercentage (absentAmount)
  end

  def to_s
  	title
  end


  def studentsForNewGrade
  r = []
  students = course.students
  students.each do |s|
    gr = Grade.where(student_id: s.id).where(test_id: id)
    r << s if gr.blank?
  end
  r
  end 
end
