Rails.application.routes.draw do
  root to: 'home#index'

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  post '/guest_login', to: 'guest_sessions#create'
  delete '/logout', to: 'guest_sessions#destroy'

  post '/callback', to: 'line_bot#callback'
  get '/account_link', to: 'line_bot#link'
  post '/account_link', to: 'line_bot#link'

  get '/account_login', to: 'account#new'
  post '/account_login', to: 'account#create'

  resources :users, only: %i[new create]

  resource :top, only: %i[new create show edit update]
  resource :bottom, only: %i[new create show edit update]
  resource :hat, only: %i[new create show edit update]
  resource :ring, only: %i[new create show edit update]
  resource :one_piece, only: %i[new create show edit update]
  resource :outer, only: %i[new create show edit update]
  resource :underwear, only: %i[new create show edit update]
  resources :materials, only: %i[index show]

  namespace :admin do
    root to: 'dashboards#index'
    get '/login', to: 'user_sessions#new'
    post '/login', to: 'user_sessions#create'
    delete '/logout', to: 'user_sessions#destroy'
    resources :materials
    resources :quizzes
  end
end
