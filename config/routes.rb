Rails.application.routes.draw do
 
  	devise_for :users
  	root "home#index"

  	get '/articles/mine', to: 'articles#mine'

  	get 'find', to: 'articles#find'

  	get 'filter', to: 'articles#filter'

  	resources :articles do
  	  	resources :comments
  	end

end