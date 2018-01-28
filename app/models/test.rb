class Test < ApplicationRecord
  belongs_to :course
  has_many :grades, dependent: :restrict_with_exception
  
  validates :minimum_grade, presence: true
  validates :date, presence: true
  validates :title, presence: true
  validates :course, presence: true
  

  #before_destroy :check_grades

  def check_grades
    if (grades.any?)
      errors.add(:grades,"No se puede borrar ya que tiene notas cargadas")
      throw :abort
    end
  end

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
     totalGrades = Grade.where("test_id" => id).count
     app = approvedAmount
     disapp = disapprovedAmount
     if ((app+disapp)>0)
       (100 *  aMount)  / (app+disapp)
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
end
