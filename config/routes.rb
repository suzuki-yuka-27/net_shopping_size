Rails.application.routes.draw do
  root to: 'home#index'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  resources :users, only: %i[new create]
  resource :top, only: %i[new create show edit update]
  resource :bottom, only: %i[new create show edit update]
end
