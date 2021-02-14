Rails.application.routes.draw do
	root 'sessions#welcome'
	resources :users

	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#login', as: 'login'
	post 'login', to: 'sessions#create'
	get 'logout', to: 'sessions#destroy', as: 'logout'
	
	# resources :users, except: [:show]
	resources :organization, :person
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
