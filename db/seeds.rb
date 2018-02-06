# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

course1 = Course.create(year: 2016)
course2 = Course.create(year: 2017)

t1 = Test.create(title:"evaluacion 1 #{course1.year}", date: Date.today, minimum_grade:4, course:course1)
t2 = Test.create(title:"evaluacion 2 #{course1.year}", date: Date.today, minimum_grade:4, course:course1)


t3 = Test.create(title:"evaluacion 1 #{course2.year}", date: Date.today, minimum_grade:4, course:course2)
t4 = Test.create(title:"evaluacion 2 #{course2.year}", date: Date.today, minimum_grade:4, course:course2)


(1..10).each do |i|
 s = Student.create(name:"estudiante #{i}", lastname:"apellido #{i}",legajo: "#{i*1000}/#{i}",email:"email#{i}@gmail.com",doc:"#{i*1000000}")
 if i.odd?
 	s.courses << course1
 	Grade.create(grade:i, student:s,test:t1)
 	Grade.create(grade:i+2, student:s,test:t2)
 else
 	s.courses << course2
 	Grade.create(grade:i, student:s,test:t3)
 	Grade.create(grade:i, student:s,test:t4)
 end 
end

User.create(email: "admin@ruby.com", password: "123456")
