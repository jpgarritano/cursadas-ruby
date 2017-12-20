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

end