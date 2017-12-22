class Course < ApplicationRecord
	has_many :tests
	#has_many :enrolments
	#has_many :students, through: :enrolments
	has_and_belongs_to_many :students

	validates :year, uniqueness: true, numericality: true

	def to_s
		year.to_s
	end
end
