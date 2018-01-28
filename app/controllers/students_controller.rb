class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    if (params[:course_id])
      @course = Course.find(params[:course_id])
      @students = @course.students
      @title = "Listado de estudiantes para cursada #{@course}"
    else
      @title= "Listado de estudiantes"
      @students = Student.all
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @courses = @student.courses
  end

  # GET /students/new
  def new
    @student = Student.new
    #@courses = @student.courses
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    #@student.courses << set_courses_to_student(params[:student][:course_ids])
    
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Estudiante creado correctamente.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Estudiante actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
      begin
      @student.destroy
      msj = 'Estudiante borrado correctamente.'
      rescue ActiveRecord::DeleteRestrictionError
      msj = "El alumno #{@student} no se puede borrar ya que posee notas cargadas."
      end
    respond_to do |format|
      format.html { redirect_to students_url, notice: msj }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :lastname, :email, :legajo, :doc, :course_ids => [])
    end

    def set_courses_to_student courses
        #esta demas!
        r = []
        courses.each do |c|
          r << Course.find(c) unless c.blank?
        end
        r
    end
end
