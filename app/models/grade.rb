class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :test

  validates :student, uniqueness: { scope: :test, message: "Una sola nota por estudiante" }  
end
