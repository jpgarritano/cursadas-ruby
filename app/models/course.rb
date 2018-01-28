class Course < ApplicationRecord
	has_many :tests, dependent: :restrict_with_exception
	#has_many :enrolments
	#has_many :students, through: :enrolments
	has_and_belongs_to_many :students

	validates :year, uniqueness: true, numericality: true
	#validates :students, uniqueness: true

	#before_destroy :check_tests

	def check_tests
		if (tests.any?)
			throw :abort
		end
	end

	def to_s
		year.to_s
	end
end
