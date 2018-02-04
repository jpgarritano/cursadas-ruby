class StudentsCourses < ActiveRecord::Migration[5.1]
  def change
	create_table :courses_students, id: false do |t|
		t.belongs_to :course, index: true
		t.belongs_to :student, index: true
        
	end
	add_index :courses_students, [:course_id,:student_id], unique: true
  end
end
