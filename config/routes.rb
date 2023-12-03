Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/descendents", to: "descendents#index"
  get "/descendents/new", to: "descendents#new"
  get '/descendents/:id', to: 'descendents#show'
  get '/descendents/:id/edit', to: 'descendents#edit', as: :edit_descendent
  patch 'descendents/:id', to: 'descendents#update'
  post "/descendents", to: "descendents#create"


  get '/descendents/:id/missions', to: 'descendent_missions#index', as: :descendent_missions
  post '/descendents/:id/missions', to: 'descendent_missions#create'
  get "/descendents/:id/missions/new", to: 'descendent_missions#new', as: :new_descendent_missions
  get "/descendents/:id/missions/sort", to: "descendent_missions#sort"

  delete "/descendents/:id", to: "descendent_missions#destroy", as: :destroy_descendent_and_missions

  get "/missions", to: "missions#index"
  get "/missions/new", to: "missions#new", as: :new_missions
  get "/missions/:id", to: "missions#show"
  get '/missions/:id/edit', to: 'missions#edit', as: :edit_mission
  post '/missions', to: 'missions#create'
  post "/missions/:id", to: "missions#show"
  patch "/missions/:id", to: "missions#update"
  delete "/missions/:id", to: "missions#destroy", as: :destroy_missions
end
