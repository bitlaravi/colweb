class CollegesController < BaseController
  before_action :set_college, only: [:show, :edit, :update, :destroy]

  def index
    @colleges = College.all
  end

  def show
  end

  def new
    @college = College.new
  end

  def edit
  end

  def create
    @college = College.new(college_params)

    if @college.save
      @user = User.create(email: @college.email_id, password: "password", password_confirmation: 'password', user_type: User::COLLEGE)
      @college.update(user_id: @user.id)
       redirect_to @college
    else
      render 'new'
    end
  end

  def update
    if @college.update(college_params)
      redirect_to @college
    else
     render 'edit'
    end
  end

  def destroy
    @college.destroy
       redirect_to colleges_url
  end

  private
    def set_college
      @college = College.find(params[:id])
    end

    def college_params
      params.require(:college).permit(:college_name, :college_code, :user_id, :email_id, :location, :college_type, :university)
    end
end
