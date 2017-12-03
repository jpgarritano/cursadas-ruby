class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, limit: 50, null:false
      t.string :lastname, limit: 50, null: false
      t.string :email, limit: 50
      t.string :legajo, limit: 30
      t.string :doc, limit: 30

      t.timestamps
    end
  end
end
