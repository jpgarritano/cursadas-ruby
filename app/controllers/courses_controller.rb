class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :general]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    @years = years
  end

  # GET /courses/1/edit
  def edit
    @years = years
  end

  def years
    (Date.today.year - 3..Date.today.year + 3).to_a
  end
  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_url, notice: 'Curso creado correctamente.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Curso actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
      begin
      @course.destroy
      msj = "Curso #{@course} borrado correctamente"
      rescue ActiveRecord::DeleteRestrictionError
      msj = "El curso #{@course} no se puede borrar ya que posee exámenes."
      end
    respond_to do |format|
        format.html { redirect_to courses_url, notice: msj }
        format.json { head :no_content }
    end
  end

  def general
    @students = @course.students
    @tests = @course.tests.order(:date, :id)
    @students.each do |s|
      @tests.each do |t|
          #Si la nota es null o no existe, se contabiliza como ausente
          g = Grade.where(test_id: t.id, student_id: s.id).empty?
          s.grades << Grade.new(test_id: t.id, student_id: s.id)
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:year)
    end
end
