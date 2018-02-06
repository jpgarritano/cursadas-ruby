class Course < ApplicationRecord
	has_many :tests, dependent: :restrict_with_exception
	#has_many :enrolments
	#has_many :students, through: :enrolments
	has_and_belongs_to_many :students, -> { distinct }

	validates :year, uniqueness: true, numericality: true
	#validates :students, uniqueness: true

	



	def to_s
		year.to_s
	end
end
