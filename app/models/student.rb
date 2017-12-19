class Student < ApplicationRecord
	#has_many :enrolments
	#has_many :courses, through: :enrolments
	has_and_belongs_to_many :courses

	validates :name, presence: true, length: {in: 1..50 }
	validates :lastname, presence: true, length: {in: 1..50 }
	validates :email, length: {in: 1..50 }
	validates :legajo, length: {in: 1..30 }
	validates :doc, length: {in: 1..30 }


	def to_s
    	"#{name} #{lastname} [#{legajo}]"
	end

end
