class Course < ApplicationRecord
	has_many :tests

	def to_s
		year.to_s
	end
end
