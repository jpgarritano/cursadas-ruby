Rails.application.routes.draw do


  devise_for :users
  
  resources :courses do
   member do
      get 'general'
   end
   resources :students, only: [:index]

	 resources :tests , except: [:show] do
      member do
        get 'add_grades'
      end
  	 	#resources :grades
  	 	
  	 	
  	 end
  end
  resources :students

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  "courses#index"
end
