class MarksController < BaseController
  before_action :set_mark, only: [:show, :edit, :update, :destroy]
  before_action :set_students, only: [:new, :edit, :update, :create]
  before_action :set_student
  def index
    if params[:student_id].present?
      @marks = Mark.includes(:student).where(student_id: params[:student_id]).order(student_name: :asc).references(:student)
    else
      @marks = Mark.includes(:student).all.order(student_name: :asc).references(:student)
    end
  end
  def show
  end

  def new
    @mark = Mark.new
  end

  def edit
  end

  def create
    @mark = Mark.new(mark_params)
      if @mark.save
        if @college.present? && @department.present? && @student.present?
          redirect_to college_department_student_marks_path(@college, @department, @student) 
        else
          redirect_to @mark 
        end
      else
        render 'new' 
      end
  end
  def update
      if @mark.update(mark_params)
        if @college.present? && @department.present? && @student.present?
        redirect_to college_department_student_marks_path 
        else
          redirect_to marks_path
        end
      else
        render 'edit'
      end
  end

  def destroy
    @mark.destroy
    if @college.present? && @department.present? && @student.present?
      redirect_to college_department_student_marks_url 
    else
      redirect_to marks_path
    end
  end

  private
    def set_mark
      @mark = Mark.find(params[:id])
    end
    def set_students
      @colleges = College.pluck(:college_name,:id)
      @departments = Department.pluck(:department_name,:id)
      @students = Student.pluck(:student_name,:id)
      @subjects = Subject.pluck(:subject,:id)
      
    end
    def set_student
      @college = College.find_by(id: params[:college_id])
      @department = Department.find_by(id: params[:department_id])
      @student = Student.find_by(id: params[:student_id])
      @subject = Subject.find_by(id: params[:subject_id])
    end

    def mark_params
      params.require(:mark).permit(:student_id, :subject, :year, :mark, :result)
    end
end
