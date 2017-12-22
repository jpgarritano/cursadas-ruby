Rails.application.routes.draw do


  devise_for :users
  #resources :grades
  resources :courses do
   resources :students, only: [:index]

	 resources :tests , except: [:show] do
  	 	resources :grades 
  	 	
  	 	
  	 end
  end
  resources :students

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  "courses#index"
end
