class Student < ApplicationRecord
	has_and_belongs_to_many :courses
	#accepts_nested_attributes_for :courses
	has_many :grades
	
	validates :name, presence: true, length: {in: 1..50 }
	validates :lastname, presence: true, length: {in: 1..50 }
	validates :email, length: {in: 1..50 }
	validates :legajo, length: {in: 1..30 }
	validates :doc, length: {in: 1..30 }

	before_destroy :checks

	def checks
		if (grades.any?)
			throw :abort
		end
	end


	def to_s
    	"#{name} #{lastname} (#{legajo})".titleize
	end

end
