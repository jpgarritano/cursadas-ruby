json.extract! student, :id, :name, :lastname, :email, :legajo, :doc, :created_at, :updated_at
json.url student_url(student, format: :json)
