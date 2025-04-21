Rails.application.routes.draw do
  # Devise routes
  devise_for :users

  # Root path
  root "home#index"

  # Admin namespace
  namespace :admin do
    get 'dashboard', to: 'admin#dashboard', as: :dashboard
  end

  # Teacher namespace
  namespace :teacher do
    get 'dashboard', to: 'dashboard#index'
  end

  # Student namespace
  namespace :student do
    get 'user/dashboard', to: 'users#dashboard', as: :user_dashboard
    resources :users, only: [:show, :edit, :update, :destroy]
  end

  # General user routes
  resources :users, only: [:edit, :update, :show]
  resource :profile, only: [:show, :edit, :update]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Development tools
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
