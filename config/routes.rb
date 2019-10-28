Rails.application.routes.draw do
	root 'static_pages#home'


  get 'dynamic_pages/welcome', to: 'dynamic_pages#welcome'

  get 'dynamic_pages/welcome/:id', to: 'dynamic_pages#welcome'

  get 'dynamic_pages/gossip', to: 'dynamic_pages#show_gossip'

  get 'dynamic_pages/gossip/:id', to: 'dynamic_pages#show_gossip', as: 'gossip'
 
  get 'static_pages/team', to: 'static_pages#team'

  get 'static_pages/contact', to: 'static_pages#contact'

end
