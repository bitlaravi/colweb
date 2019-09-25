class AttendencesController < BaseController
  before_action :set_attendence, only: [:show, :edit, :update, :destroy]
  before_action :set_students, only: [:new, :edit, :update, :create]
  before_action :set_student
  def index
    if @college.present? && @department.present? && @student.present?
      @attendences = Mark.where(college_id: params[:college_id],department_id: params[:department_id],student_id: params[:student_id]).order(attendence: :asc)
    elsif @department.present? && @student.present?
      @attendences = Mark.where(department_id: params[:department_id],student_id: params[:student_id]).order(attendence: :asc)
    elsif @student.present?
      @attendences = Mark.where(student_id: params[:student_id]).order(attendence: :asc)
    else
      @attendences = Mark.all.order(subject: :asc)
    end
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
        if @college.present? && @department.present? && @student.present?
          redirect_to college_department_student_attendences_path(@college,@department,@student)
        elsif @department.present?
          redirect_to department_student_attendences_path(@department,@student)
        elsif @student.present?
          redirect_to student_attendences_path(@student)
        else
          redirect_to attendences_path 
        end
      else
        render 'new'
      end
  end

  def update
      if @college.present? && @department.present? && @student.present?
        redirect_to college_department_student_attendences_path(@college,@department,@student)
      elsif @department.present?
        redirect_to department_student_attendences_path(@department,@student)
      elsif @student.present?
        redirect_to student_attendences_path(@student)
      else
        render 'edit'
      end
  end
  def destroy
    if @college.present? && @department.present? && @student.present?
      redirect_to college_department_student_attendences_path(@college,@department,@student)
    elsif @department.present?
      redirect_to department_student_attendences_path(@department,@student)
    elsif @student.present?
      redirect_to student_attendences_path(@student)
    end   
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
