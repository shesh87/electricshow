Rails.application.routes.draw do

  get "/" => "events#home", as: "home"
  get "/search" => "events#search", as: "search"
  get "search/results" => "events#results"

  resources :events

end
