class LabSpecilitiesController < BaseController
  before_action :set_lab_specility, only: [:show, :edit, :update, :destroy]
  before_action :set_departments, only: [:new, :edit, :update, :create]
  before_action :set_department

  def index
    if @department.present?
      @lab_specilities = LabSpecility.where(department_id: params[:department_id])
    else
      @lab_specilities = LabSpecility.all
    end
  end

  def show
  end
  def new
    @lab_specility =  LabSpecility.new
  end

  def edit
  end

  def create
    @lab_specility = LabSpecility.new(lab_specility_params)
    if @lab_specility.save
      if @college.present? && @department.present? 
        redirect_to college_department_lab_specilities_path(@college, @department)
      elsif @department.present?
        redirect_to department_lab_specilities_path(@department) 
      else
        redirect_to lab_specilities_path
      end
    else
      render 'new'
    end
  end

  def update
    if @lab_specility.update(lab_specility_params)
      if @college.present? && @department.present? 
        redirect_to college_department_lab_specilities_path(@college, @department)
      elsif @department.present?
        redirect_to department_lab_specilities_path(@department) 
      else
        redirect_to lab_specilities_path
      end
    else
      render 'edit'
    end
  end

  def destroy
    @lab_specility.destroy
    if @college.present? && @department.present? 
        redirect_to college_department_lab_specilities_path(@college, @department)
    elsif @department.present?
      redirect_to department_lab_specilities_path(@department)
    else
      redirect_to lab_specilities_path
    end 
  end

  private
    def set_lab_specility
      @lab_specility = LabSpecility.find(params[:id])
    end
    def set_departments
      @colleges = College.pluck(:college_name,:id)
      @departments = Department.all.pluck(:department_name,:id)
    end
    def set_department
      @college = College.find_by(id: params[:college_id])
      @department = Department.find_by(id: params[:department_id])
    end

    def lab_specility_params
      params.require(:lab_specility).permit(:college_id, :department_id, :lab_name, :lab_incharge)
    end
end
