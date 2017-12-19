class Test < ApplicationRecord
  belongs_to :course
  
  validates :minimum_grade, presence: true
  validates :title, presence: true
  validates :course, presence: true

  def to_s
  	title
  end
end
