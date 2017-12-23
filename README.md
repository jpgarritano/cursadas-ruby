# README

## Aplicación web para gestión de cursadas:
  
  Desarrollado en Rails 5.1.4, Ruby 2.4.2

### Gemas utilizadas

* [Simple Form](https://github.com/plataformatec/simple_form):
gem 'simple_form'
* [Bootstrap](https://github.com/twbs/bootstrap-rubygem):
gem 'bootstrap'
* [Devise (Login)](https://github.com/plataformatec/devise):
gem 'devise'
* [Jquery-rails](https://github.com/rails/jquery-rails):
gem 'jquery-rails'


### Utiliza MySQL Por defecto.
(ver configuración en config/database.yml)

### Para la creación de la Base de datos correr:

	
	rails db:create
    rails db:migrate
	
### Para su inicialización:
	
    rails db:seed
    

### Test de modelos 
```
 rails test test/models/grade_test.rb 
 rails test test/models/test_test.rb 
 rails test test/models/course_test.rb 
 rails test test/models/student_test.rb 

 (tambien para test/controllers/)
```



### Sobre la aplicación web:


Aplicación web para llevar registro de las notas de las evaluaciones​ de​ ​la materia.

Para esto se manejan las distintas entidades:
  Cursadas: Una por año académico. Estas contendran evaluaciones y estudiantes asociados

  Evaluaciones: Se agregan a cada cursada, con titulo o descripción, fecha y una nota mínima que definira si el estudiante aprobó o no.
  

  Notas: Se crean las notas a los estudiantes de la cursada, si la nota es mayor o igual a la nota mínima figurará *aprobado*; si es menor, *desaprobado*, y si se carga con valor vacío figurará *Ausente*.

  Estudiantes: Se dan de alta estudiantes, con sus respectivos datos, nombre, apellido, legajo, email y documento y se lo asocia directamente a las cursadas creadas (puede estar inscripto a mas de una cursada)
  Se maneja directamente modificando al estudiante y seleccionando las cursadas donde se lo va a inscribir.