class MarksController < BaseController
  before_action :set_mark, only: [:show, :edit, :update, :destroy]
  before_action :set_students, only: [:new, :edit, :update, :create]
  before_action :set_student
  def index
    if @college.present? && @department.present? && @student.present?
      @marks = Mark.where(college_id: params[:college_id],department_id: params[:department_id],student_id: params[:student_id]).order(mark: :asc)
    elsif @department.present? && @student.present?
      @marks = Mark.where(department_id: params[:department_id],student_id: params[:student_id]).order(mark: :asc)
    elsif @student.present?
      @marks = Mark.where(student_id: params[:student_id]).order(mark: :asc)
    else
      @marks = Mark.all.order(mark: :asc)
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
          redirect_to college_department_student_marks_path(@college, @department,@student)
        elsif @department.present?
          redirect_to department_student_marks_path(@department,@student)
        elsif @student.present?
          redirect_to student_marks_path(@student) 
        else
          redirect_to marks_path 
        end
      else
        render 'new' 
      end
  end
  def update
      if @mark.update(mark_params)
        if @college.present? && @department.present? && @student.present?
        redirect_to college_department_student_marks_path(@college, @department,@student)
        elsif @department.present?
          redirect_to department_student_marks_path(@department,@student)
        elsif @student.present?
          redirect_to student_marks_path(@student)
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
      redirect_to college_department_student_marks_path(@college, @department,@student)
    elsif @department.present?
      redirect_to department_student_marks_path(@department,@student)
    elsif @student.present?
      redirect_to student_marks_path(@student) 
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
