class CourcesController < BaseController
  before_action :set_cource, only: [:show, :edit, :update, :destroy]
  before_action :set_departments, only: [:new, :edit, :update, :crete]
  before_action :set_department

  def index
    if @college.present? && @department.present?
      @cources = Cource.where(college_id: params[:college_id],department_id: params[:department_id]).order(cource: :asc)
    elsif @department.present?
      @cources= Cource.where(department_id: params[:department_id]).order(cource: :asc)
    end
  end

  def show
  end

  def new
    @cource = Cource.new
  end

  def edit
  end

  def create
    @cource = Cource.new(cource_params)

    if @cource.save
      if @college.present? && @department.present? 
        redirect_to college_department_cources_path(@college, @department)
      elsif @department.present?
        redirect_to department_cources_path(@department) 
      else
        redirect_to cources_path
      end 
    else
       render 'new'
    end
  end

  def update
    if @cource.update(cource_params)
      if @college.present? && @department.present? 
        redirect_to college_department_cources_path(@college, @department)
      elsif @department.present?
        redirect_to department_cources_path(@department) 
      else
        redirect_to cources_path
      end
    else
      render 'edit'
    end
  end
  def destroy
    @cource.destroy
    if @college.present? && @department.present? 
      redirect_to college_department_cources_path(@college, @department)
    elsif @department.present?
      redirect_to department_cources_path(@department)  
    else
      redirect_to cources_path
    end 
  end

  private
    def set_cource
      @cource = Cource.find(params[:id])
    end
    def set_departments
      @colleges = College.pluck(:college_name,:id)
      @departments = Department.all.pluck(:department_name,:id)
    end
    def set_department
      @department = Department.find_by(id: params[:department_id])
      @college = College.find_by(id: params[:college_id])
    end

    def cource_params
      params.require(:cource).permit(:college_id, :department_id, :cource)
    end
end
