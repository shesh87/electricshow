Rails.application.routes.draw do

  
  get "/" => "events#home", as: "home"
  get "/search" => "events#search", as: "search"
  get "/search/results" => "events#results"

  resources :events


  get "/admin" => "songkick_artists#admin"
  get "" => ""
  get "/admin/songkick_artists/new" => "songkick_artists#create"

  # post "/admin/search" => "events#search_songkick"

end
