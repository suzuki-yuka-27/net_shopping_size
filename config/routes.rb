Rails.application.routes.draw do
  root to: 'home#index'
  get '/guest_login', to: 'user_sessions#guest_login'
  post '/guest_login', to: 'user_sessions#guest_login'
  get '/logout', to: 'user_sessions#destroy'
  get 'line_login_api/login', to: 'line_login_api#login'
  get 'line_login_api/callback', to: 'line_login_api#callback'
  post '/callback', to: 'line_bot#callback'

  resource :top
  resource :bottom
  resource :hat
  resource :ring
  resource :one_piece
  resource :outer
  resource :underwear
end
