class SessionsController < ApplicationController

def new

end

def create
	user = User.find_by(user_email_id: params[:session][:user_email_id].downcase)

	if user && user.authenticate(params[:session][:password])

			session[:user_id] = user.id

			flash[:success] = "You have successfully logged in"

			redirect_to home1_index_path

	else

		flash.now[:danger] = "There was something wrong with your login information"

		render 'new'

	end

end
def destroy
	session[:user_id] = nil

	flash[:success] = "You have logged out"

	redirect_to root_path
end

end