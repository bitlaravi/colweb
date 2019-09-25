class CourcesController < BaseController
  before_action :set_cource, only: [:show, :edit, :update, :destroy]
  before_action :set_colleges, only: [:new, :edit, :update, :crete]
  before_action :set_college

  def index
    @cources = Cource.where(college_id: params[:college_id], department_id: params[:department_id])
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
      redirect_to college_department_cources_path 
    else
       render 'new'
    end
  end

  def update
    if @cource.update(cource_params)
      redirect_to college_department_cource_path 
    else
      render 'edit'
    end
  end
  def destroy
    @cource.destroy
      redirect_to college_department_cources_url 
  end

  private
    def set_cource
      @cource = Cource.find(params[:id])
    end
    def set_colleges
      @colleges = College.all.pluck(:college_name,:id)
      
    end
    def set_college
      @college = College.find_by(id: params[:college_id])
      @department = Department.find_by(id: params[:department_id])
      
    end

    def cource_params
      params.require(:cource).permit(:college_id, :department_id, :cource)
    end
end
