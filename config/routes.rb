Rails.application.routes.draw do
  root to: 'home#index'


  resource :top, only: %i[new create show edit update]
  resource :bottom, only: %i[new create show edit update]
  resource :hat, only: %i[new create show edit update]
  resource :ring, only: %i[new create show edit update]
  resource :one_piece, only: %i[new create show edit update]
  resource :outer, only: %i[new create show edit update]
  resource :underwear, only: %i[new create show edit update]
end
