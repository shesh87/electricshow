Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_scope :user do
    get "/users/:id" => "users#show", as: "user_page"
  end

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

  resources :posts

  get "/events/:id/posts/new" => "posts#new", as: "new_event_post"
  post "/events/:id/posts" => "posts#create", as: "event_posts"
  delete "/posts/:id" => "posts#destroy", as: "delete_post"
  


end
