Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  # get  '/home', to: 'pages#home'
  get '/detail', to: 'pages#detail'
  get '/products', to: 'products#new'
  get '/signup', to: 'users#new'
  resources :users
  resources :products, only: [:show]
end
