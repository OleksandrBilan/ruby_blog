Rails.application.routes.draw do

  devise_for :users
  root "home#index"

  get '/articles/mine', to: 'articles#mine'

  resources :articles do
    resources :comments
  end

end
