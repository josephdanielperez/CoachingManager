Rails.application.routes.draw do
  resources :services
  resources :employees
  resources :users do 
    resources :appointments
  end
  resources :appointments

  root to: 'welcome#home'

  get 'welcome/home' => 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  get '/users/most_appointments' => 'users#most_appointments'
end