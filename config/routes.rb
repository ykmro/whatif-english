Rails.application.routes.draw do
  root "pages#top"

  resources :users, only: [ :new, :create ]

  resource :session, only: [ :new, :create, :destroy ]

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
