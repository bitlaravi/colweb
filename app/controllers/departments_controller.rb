class DepartmentsController < BaseController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  before_action :set_colleges, only: [:new, :create, :update, :edit]
  before_action :set_college
  def index
    if @college.present?
    @departments = Department.where(college_id: params[:college_id])
    else
      @departments =Department.all
    end
  end
  def show
  end
  def new
    @department = Department.new
  end
  def edit
  end
  def create
    @department = Department.new(department_params)
    if @department.save
      @user = User.create(email: @department.email_id, user_type: User::DEPARTMENT, password: "password", password_confirmation: "password")
      @department.update(user_id: @user.id)
      if @college.present?
      redirect_to college_departments_path 
      else
        redirect_to departments_path
      end
    else
      render 'new'
    end
  end
  def update
    if @department.update(department_params)
      if @college.present?
      redirect_to college_departments_path 
      else
        redirect_to departments_path
      end
    else
     render 'edit' 
    end
  end
  def destroy
    @department.destroy
    if @college.present?
      redirect_to college_departments_path 
    else
      redirect_to departments_path
    end
  end

  private
    def set_department
      @department = Department.find(params[:id])
    end
    def set_colleges
      @colleges = College.all.pluck(:college_name,:id)
      
    end
    def set_college
      @college = College.find_by(id: params[:college_id])
      
    end
    def department_params
      params.require(:department).permit(:college_id, :email_id, :user_id, :department_name, :department_code)
    end
end
