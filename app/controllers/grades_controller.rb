class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json
  def index
    @test = Test.find(params[:test_id])
    @grades = @test.grades
    
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
 def new
    @grade = Grade.new(test_id: params[:test_id])
  end


  # GET /grades/1/edit
  def edit
    @students = @grade.test.course.students
  end

  # POST /grades
  # POST /grades.json
  def create
     @grade = Grade.new(grade_params)
     
    respond_to do |format|
      if @grade.save
        format.json { render :show, status: :created, location: course_test_grades_url(@grade.test) }
        format.html { redirect_to course_test_grades_url(@grade.test), notice: 'Nota agregada correctamente.' }
      else
        format.json { render json: @grade.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to course_test_grades_url(@grade.test), notice: 'Nota actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    test = @grade.test
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to add_grades_course_test_url(test.course,test), notice: 'Nota borrada correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:grade, :student_id, :test_id)
    end
end
