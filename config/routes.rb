Rails.application.routes.draw do

  
  get "/" => "events#home", as: "home"
  get "/search" => "events#search", as: "search"
  get "/search/results" => "events#results"

  resources :events


  get "/admin" => "songkick_artists#admin"
  get "/admin/songkick_artists/new" => "songkick_artists#new"
  post "/admin/songkick_artists" => "songkick_artists#create"
  get "/admin/songkick_artists" => "songkick_artists#index", as: "index"


  # post "/admin/search" => "events#search_songkick"

end
