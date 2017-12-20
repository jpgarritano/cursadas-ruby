class Test < ApplicationRecord
  belongs_to :course
  has_many :grades
  
  validates :minimum_grade, presence: true
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

  def approvedPercentage
  	 #segun Trabajo Practico el porcentaje se calcula por sobre el numero de presentes
  	 totalGrades = Grade.where("test_id" => id).count
  	 app = approvedAmount
  	 disapp = disapprovedAmount
  	 (100 *  approvedAmount)  / (app+disapp)

  end

  def to_s
  	title
  end
end
