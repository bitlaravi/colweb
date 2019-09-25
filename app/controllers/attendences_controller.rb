class AttendencesController < BaseController
  before_action :set_attendence, only: [:show, :edit, :update, :destroy]
  before_action :set_students, only: [:new, :edit, :update, :create]
  before_action :set_student
  def index
    @attendences = Attendence.includes(:student).where(student_id: params[:student_id]).order(student_name: :asc).references(:student)
  end

  def show
  end

  def new
    @attendence = Attendence.new
  end

  def edit
  end

  def create
    @attendence = Attendence.new(attendence_params)
      if @attendence.save
        redirect_to college_department_student_attendences_path
      else
        render 'new'
      end
  end

  def update
      if @attendence.update(attendence_params)
        redirect_to college_department_student_attendence_path
      else
        render 'edit'
      end
  end
  def destroy
    @attendence.destroy
    redirect_to college_department_student_attendences_url
  end

  private
    def set_attendence
      @attendence = Attendence.find(params[:id])
    end
     def set_students
      @colleges = College.pluck(:college_name,:id)
      @departments = Department.pluck(:department_name,:id)
      @students = Student.pluck(:student_name,:id)
      
    end
    def set_student
      @college = College.find_by(id: params[:college_id])
      @department = Department.find_by(id: params[:department_id])
      @student = Student.find_by(id: params[:student_id])
    end


    def attendence_params
      params.require(:attendence).permit(:student_id, :year, :semester, :total_hours, :present, :absent, :average, :exam_eligibility)
    end
end
