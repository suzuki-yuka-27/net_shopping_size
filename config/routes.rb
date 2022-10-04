Rails.application.routes.draw do
  root to: 'home#index'
  get 'line_login_api/login', to: 'line_login_api#login'
  get 'line_login_api/callback', to: 'line_login_api#callback'

  resource :top, only: %i[new create show edit update]
  resource :bottom, only: %i[new create show edit update]
end
