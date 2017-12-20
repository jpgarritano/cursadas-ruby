Rails.application.routes.draw do


  #resources :grades
  resources :courses do
   resources :students, only: [:index]
#  resources :students, shallow: true
	 resources :tests do
  	 	resources :grades 
  	 	
  	 	#member do 
  	 	#	get 'list_grades'
  	 	#end
  	 end
  end
  resources :students

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  "courses#index"
end
