Rails.application.routes.draw do
  root to: 'home#index'

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  post '/guest_login', to: 'guest_sessions#create'
  delete '/logout', to: 'guest_sessions#destroy'

  resources :users, only: %i[new create]

  resource :top, only: %i[new create show edit update]
  resource :bottom, only: %i[new create show edit update]
  resource :hat, only: %i[new create show edit update]
  resource :ring, only: %i[new create show edit update]
  resource :one_piece, only: %i[new create show edit update]
  resource :outer, only: %i[new create show edit update]
  resource :underwear, only: %i[new create show edit update]

  namespace :admin do
    root to: 'dashboards#index'
    get '/login', to: 'user_sessions#new'
    post '/login', to: 'user_sessions#create'
    delete '/logout', to: 'user_sessions#destroy'
    resources :materials
  end
end
