Rails.application.routes.draw do
  root to: 'home#index'
  get '/guest_login', to: 'user_sessions#guest_login'
  post '/guest_login', to: 'user_sessions#guest_login'
  get '/logout', to: 'user_sessions#destroy'
  get 'line_login_api/login', to: 'line_login_api#login'
  get 'line_login_api/callback', to: 'line_login_api#callback'

  resources :tops
  resources :bottoms
  resources :hats
end
