class Test < ApplicationRecord
  belongs_to :course
  
  validates :minimum_grade, presence: true

  def to_s
  	title
  end
end
