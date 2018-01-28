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

  def approvedPercentage
  	 #segun Trabajo Practico el porcentaje se calcula por sobre el numero de presentes
  	 totalGrades = Grade.where("test_id" => id).count
  	 app = approvedAmount
  	 disapp = disapprovedAmount
     if ((app+disapp)>0)
  	   (100 *  approvedAmount)  / (app+disapp)
     else 0
     end
  end

  def disapprovedPercentage
    totalGrades = Grade.where("test_id" => id).count
     app = approvedAmount
     disapp = disapprovedAmount
     if ((app+disapp)>0)
       (100 *  disapprovedAmount)  / (app+disapp)
     else 0
     end
  end

  def absentPercentage
    totalGrades = Grade.where("test_id" => id).count
     app = approvedAmount
     disapp = disapprovedAmount
     if ((app+disapp)>0)
       (100 *  absentAmount)  / (app+disapp)
     else 0
     end
  end

  def to_s
  	title
  end
end
