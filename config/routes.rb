Rails.application.routes.draw do
  resources :appointments

  resources :locations do 
    resources :appointments, only: [:index, :show, :new]
  end

  resources :clients do 
    resources :appointments, only: [:index, :show, :new]
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  get 'welcome/home'
  root 'welcome#home'
  
  get '/about', to: 'welcome#about'
  
  get '/locations/:id/client_list', to: 'locations#client_list', as: 'client_list'
end