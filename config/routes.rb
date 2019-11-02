Rails.application.routes.draw do

	root 'gossips#index'
	
  get 'welcome', to: 'dynamic_pages#welcome'

  get 'welcome/:id', to: 'dynamic_pages#welcome'

  get 'team', to: 'static_pages#team'

  get 'contact', to: 'static_pages#contact'

  resources :users
  resources :sessions
  resources :comments
  resources :authors
  resources :cities
  resources :gossips

end
