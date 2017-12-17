class Student < ApplicationRecord
	
	validates :name, presence: true, length: {in: 1..50 }
	validates :lastname, presence: true, length: {in: 1..50 }
	validates :email, length: {in: 1..50 }
	validates :legajo, length: {in: 1..30 }
	validates :doc, length: {in: 1..30 }

end
