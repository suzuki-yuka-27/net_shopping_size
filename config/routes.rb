Rails.application.routes.draw do
  root to: 'home#index'
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
  post "/callback", to: "line_bot#callback"

  resource :top, only: %i[new create show edit update]
  resource :bottom, only: %i[new create show edit update]
end
