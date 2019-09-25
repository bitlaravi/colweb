class StudentsController < BaseController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_departments, only: [:new, :edit, :update, :create]
  before_action :set_department

  def index
    if @college.present? && @department.present?
      @students = Student.where(college_id: params[:college_id],department_id: params[:department_id]).order(student_name: :asc)
    else
      @students = Student.all.order(student_name: :asc)
    end
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end
  def create
    @student = Student.new(student_params)
      if @student.save
        @user = User.create(email: @student.email, user_type: User::STUDENT, password: "password", password_confirmation: "password")
        @student.update(user_id: @user.id)
          if @college.present? && @department.present?
          redirect_to college_department_students_path  
        else
          redirect_to @student
        end
      else
        render 'new'
      end
  end

  def update
      if @student.update(student_params)
        if @college.present? && @department.present?
         redirect_to college_department_student_path 
       else
        redirect_to @student
      end
      else
        render 'edit' 
    end
  end

  def destroy
    @student.destroy
    if @college.present? && @department.present?
      redirect_to students_url 
    else
      redirect_to @student
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end
    def set_departments
      @colleges = College.pluck(:college_name,:id)
      @departments = Department.pluck(:department_name,:id)
    end
    def set_department
      @college = College.find_by(id: params[:college_id])
      @department = Department.find_by(id: params[:department_id])
    end

    def student_params
      params.require(:student).permit(:college_id, :department_id, :user_id, :register_no, :student_name, :fathers_name, :mothers_name, :dob, :age, :email, :password, :hslc_perscentage, :hsc_perscentage, :year, :semester, :accomadation, :date_of_joining, :address1, :address2, :city, :district, :pin, :state, :adhar_no, :pan_no)
    end
end
