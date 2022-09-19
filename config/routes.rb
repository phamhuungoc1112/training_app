Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  # get  '/home', to: 'pages#home'
  get '/detail', to: 'pages#detail'

  get '/signup', to: 'users#new'
  resources :users
  resources :products
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
