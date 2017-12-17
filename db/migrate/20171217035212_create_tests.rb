class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.date :date
      t.float :minimum_grade
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
