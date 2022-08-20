Rails.application.routes.draw do
  root to: 'home#index'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :sizes, only: %i[index] do
    resource :top, only: %i[new create edit update]
  end
  resources :tops
end
