Rails.application.routes.draw do
  # Devise routes
  devise_for :users, controllers: {
  sessions: 'users/sessions'
}

devise_scope :user do
  get 'users/sign_out', to: 'devise/sessions#destroy'
end


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
  # config/routes.rb
namespace :student do
  resources :users, only: [:show, :edit, :update, :destroy] do
    get 'dashboard', on: :collection
  end
end
# config/routes.rb
namespace :student do
  get 'student/users/dashboard', to: 'student/users#dashboard'
end

  # General user routes (ensure to namespace or scope to avoid conflict with student routes)
  # resources :users, only: [:edit, :update, :show], module: :users

  # Profile routes
  resource :profile, only: [:show, :edit, :update]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  get 'users', to: 'users#index'

  # Development tools
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
