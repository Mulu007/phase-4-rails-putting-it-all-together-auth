Rails.application.routes.draw do
  # resources :users
  post "/signup",to: "users#create"
  post "/login",to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/me", to: "users#show"
  resources :recipes, only: [:index, :create]
end
