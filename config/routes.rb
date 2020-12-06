Rails.application.routes.draw do
  resources :employees
  resources :users, except: :show do 
    resources :appointments
  end
  resources :appointments

  root 'users#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  get '/users/most_appointments', :to => 'users#most_appointments', :as => 'most_appointments'
end