Rails.application.routes.draw do
  root "pages#top"

  resources :users, only: [ :new, :create ]
  resources :studylogs, only: [ :index, :show ]

  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  resources :situations, only: [ :index, :show ] do
    member do
      get :result
    end
  end

  resources :steps, only: [ :show ] do
    member do
      post :next
      get :result
    end
  end

  get "terms", to: "pages#terms", as: :terms

  get "up" => "rails/health#show", as: :rails_health_check
end
