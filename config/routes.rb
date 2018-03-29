Rails.application.routes.draw do
get "/signin", to: "sessions#new"
post "/sessions/create", to: "sessions#create"
get "/signout", to: "sessions#destroy"
post "/ride", to: "rides#new"

root "sessions#home"

resources :users
resources :attractions
end
