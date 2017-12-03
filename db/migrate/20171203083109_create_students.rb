class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, limit: 50
      t.string :lastname, limit: 50
      t.string :email, limit: 50
      t.string :legajo, limit: 10
      t.string :doc, limit: 30

      t.timestamps
    end
  end
end
