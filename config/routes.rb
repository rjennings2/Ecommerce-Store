Rails.application.routes.draw do
  get "customers/new"
  get "customers/create"
  get "customers/show"
  get "customers/edit"
  get "customers/update"
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :products
    resources :categories
  end

  resources :customers, only: [:new, :create, :show, :edit, :update]
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
