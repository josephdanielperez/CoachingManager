Rails.application.routes.draw do
  resources :employees
  resources :users do 
    resources :appointments
  end
  resources :appointments

  root 'users#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'
  
end