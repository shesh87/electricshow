Rails.application.routes.draw do

  devise_for :users
  root "events#home"
  
  get "/" => "events#home", as: "home"
  get "/search" => "events#search", as: "search"
  get "/search/results" => "events#results"
  post "/search/:city" => "events#location"

  resources :events


  get "/admin" => "songkick_artists#admin"
  get "/admin/songkick_artists/new" => "songkick_artists#new"
  post "/admin/songkick_artists" => "songkick_artists#create"
  get "/admin/songkick_artists" => "songkick_artists#index", as: "index"

  # resources :users


  # devise_for :users, controllers: {
  #   sessions: 'sessions'
  # }


end
