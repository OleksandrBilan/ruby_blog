Rails.application.routes.draw do

  devise_for :users
  root "home#index"

  get '/articles/mine', to: 'articles#mine'

  get 'find', to: 'articles#find'

  resources :articles do
    resources :comments
  end

end
