class StaffsController < BaseController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :set_departments, only: [:new, :edit, :update, :create]
  before_action :set_department

  def index
    @staffs = Staff.where(college_id: params[:college_id],department_id: params[:department_id])
  end

  def show
  end

  def new
    @staff = Staff.new
  end

  def edit
  end

  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      @user = User.create(email: @staff.email_id, user_type: User::STAFF, password: "password", password_confirmation: "password")
      @staff.update(user_id: @user.id)
      if @college.present? && @department.present?
        redirect_to college_department_staffs_path  
      else
        redirect_to @staff
      end
    else
      render 'new'
    end
  end
  def update
    if @staff.update(staff_params)
      if @college.present? && @department.present?
        redirect_to college_department_staff_path  
      else
        redirect_to @staff
      end 
    else
      render 'edit'
    end
  end

  def destroy
    @staff.destroy
    if @college.present? && @department.present?
      redirect_to college_department_staffs_path  
    else
      redirect_to @staff
    end
  end

  private
    def set_staff
      @staff = Staff.find(params[:id])
    end
    def set_departments
      @colleges = College.pluck(:college_name,:id)
      @departments = Department.all.pluck(:college_name,:id)
    end
    def set_department
      @department = Department.find_by(id: params[:department_id])
      @college = College.find_by(id: params[:college_id])
    end

    def staff_params
      params.require(:staff).permit(:college_id ,:department_id,:user_id, :staff_name, :age, :posission, :experience, :contact_no, :email_id, :password )
    end
end
