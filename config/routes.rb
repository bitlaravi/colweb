Rails.application.routes.draw do
  devise_for :users
  get 'homes/index'
  root 'homes#index'
  resources :homes
  resources :home1
  resources :colleges do
	  resources :departments do
	  	resources :lab_specilities
	  	resources :cources
	  	resources :staffs
	  	resources :subjects
  		resources :students do
  			resources :marks
  			resources :attendences
  		end
	  end
	end
	resources :students
	resources :departments
	resources :marks
  resources :attendences 
  resources :staffs
  resources :cources 
  resources :lab_specilities
  resources :subjects
  resources :departments do
    resources :lab_specilities
    resources :cources
    resources :staffs
    resources :subjects
    resources :students do
      resources :marks
      resources :attendences
    end
  end
  resources :students do
    resources :marks
    resources :attendences
  end
end
