Rails.application.routes.draw do
  root to: 'home#index'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :sizes, shallow: true do
    resources :tops, only: %i[new create show edit update]
    resources :bottoms, only: %i[new create show edit update]
  end
end
