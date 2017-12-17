class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.float :grade
      t.belongs_to :student, foreign_key: true
      t.belongs_to :test, foreign_key: true

      t.timestamps
    end
  end
end
