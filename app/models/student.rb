class Student < ApplicationRecord
	has_and_belongs_to_many :courses, -> { distinct }
	#accepts_nested_attributes_for :courses
	has_many :grades, dependent: :restrict_with_exception
	
	validates :name, presence: true, length: {in: 1..50 }
	validates :lastname, presence: true, length: {in: 1..50 }
	validates :email, length: {in: 1..50 } , uniqueness: true
	validates :legajo, length: {in: 1..30 } , uniqueness: true
	validates :doc, length: {in: 1..30 } , uniqueness: true



	def to_s
    	"#{name} #{lastname} (#{legajo})".titleize
	end

	def allGrades
		Grade.joins(:test).all.where(student_id: self.id).order("tests.date, tests.id")
	end

	def allGradesFromGrade course
		allGrades.select do | g | g.test.course == course end
	end

end
