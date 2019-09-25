class ApplicationController < ActionController::Base
	before_action :configure_devise_params, if: :devise_controller?

	def configure_devise_params
		devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type])
		devise_parameter_sanitizer.permit(:account_update, keys: [:user_type])
	end

	def after_sign_in_path_for(resource)
		if resource.user_type == User::ADMIN
			colleges_path
		elsif resource.user_type == User::COLLEGE
			college = College.find_by(user_id: resource.id)
			college_departments_path(college)
		elsif resource.user_type == User::DEPARTMENT
			department = Department.find_by(user_id: resource.id)
			department_path(department)
		elsif resource.user_type == User::STAFF
			staff = Staff.find_by(user_id: resource.id)
			college_department_staffs_path(staff)
		elsif resource.user_type == User::STUDENT
			student = Student.find_by(user_id: resource.id)
			student_path(student)
		else
			colleges_path
		end	
	end
end
