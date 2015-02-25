Rails.application.routes.draw do

  get "/" => "events#index", as: "index"

  resources :events

end
