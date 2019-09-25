class SubjectsController < BaseController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :set_departments, only: [:new, :edit, :update, :create]
  before_action :set_department

  def index
    if @college.present? && @department.present?
      @subjects = Subject.where(college_id: params[:college_id],department_id: params[:department_id]).order(subject: :asc)
    elsif @department.present?
      @subjects = Subject.where(department_id: params[:department_id]).order(subject: :asc)
    else
      @subjects = Subject.all.order(subject: :asc)
    end
  end

  def show
  end
  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      if @college.present? && @department.present?
        redirect_to college_department_subjects_path(@college,@department)
      elsif @department.present?
        redirect_to department_subjects_path(@department)

      else
        redirect_to subjects_path
      end
    else
      render 'new'
    end
  end

  def update
    if @subject.update(subject_params)
      if @college.present? && @department.present?
        redirect_to college_department_subjects_path(@college,@department)
      elsif @department.present?
          redirect_to department_subjects_path(@department)
      else
        redirect_to subjects_path
      end
    else
       render 'edit'
    end
  end

  def destroy
    @subject.destroy
    if @college.present? && @department.present?
      redirect_to college_department_subjects_path(@college,@department)
    elsif @department.present?
        redirect_to department_subjects_path(@department)
    else
      redirect_to subjects_path
    end 
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end
    def set_departments
      @colleges = College.pluck(:college_name,:id)
      @departments = Department.all.pluck(:college_id,:id)
    end
    def set_department
      @college = College.find_by(id: params[:college_id])
      @department = Department.find_by(id: params[:department_id])
    end

    def subject_params
      params.require(:subject).permit(:college_id, :department_id, :subject_code, :subject)
    end
end
