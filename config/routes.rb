Rails.application.routes.draw do
  resources :grades
  resources :courses do
	resources :tests
  end
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  "courses#index"
end
