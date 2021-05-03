Rails.application.routes.draw do
 
  	devise_for :users
  	root "home#index"

  	get '/articles/mine', to: 'articles#mine'

  	get 'find', to: 'articles#find'

  	get 'filter', to: 'articles#filter'

  	resources :articles do
  	  	resources :comments
		member do
			delete 'delete_image/:image_id', action: 'delete_index', as: 'delete_image'
		end
  	end

end