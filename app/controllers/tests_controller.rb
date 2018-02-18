class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy, :add_grades]

  # GET /tests
  # GET /tests.json
  def index
    #@tests = Test.all
    @curso = Course.find(params[:course_id])
    @tests = @curso.tests.order('date')
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new(course_id: params[:course_id])
    #@test.course = Course.find()
  end

  def add_grades
    @students = @test.studentsForNewGrade
    @students.each  do |s|
      @test.grades.build(student_id: s.id)
  end

    
  end
  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to course_tests_url(@test.course), notice: 'Evaluación creada correctamente.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      
      students = @test.course.students
      st = students.collect do |s|
        s.id.to_s
      end

      params[:test][:grades_attributes].each do |g, v|
          if (!st.include? v[:student_id])
            s = Student.find(v[:student_id])
            format.html { redirect_to course_tests_url(@test.course), notice: "No se cargaron la notas ya que el estudiante #{s.name} no está inscripto" }
          end
      end

      if @test.update(test_params)
        format.html { redirect_to course_tests_url(@test.course), notice: "Evaluación #{@test} actualizada correctamente." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    begin
    @test.destroy
    msj = "La evaluación #{@test} se ha borrado correctamente"
    rescue ActiveRecord::DeleteRestrictionError
    msj = "La evaluación #{@test} no se puede borrar."
    end
    
    respond_to do |format|
      format.html { redirect_to course_tests_url, notice: msj }
      format.json { head :no_content }
    end
  end
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:title, :date, :minimum_grade, :course_id,
        grades_attributes:[:id, :grade, :student_id]
        )
    end
end
