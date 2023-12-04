Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/descendents", to: "descendents#index"
  get "/descendents/new", to: "descendents#new", as: :new_descendent
  post "/descendents", to: "descendents#create", as: :create_descendent
  get '/descendents/:id', to: 'descendents#show', as: :show_descendent
  patch 'descendents/:id', to: 'descendents#update', as: :update_descendent
  get '/descendents/:id/edit', to: 'descendents#edit', as: :edit_descendent


  get '/descendents/:id/missions', to: 'descendent_missions#index', as: :descendent_missions
  post '/descendents/:id/missions', to: 'descendent_missions#create', as: :create_descendent_mission
  get "/descendents/:id/missions/new", to: 'descendent_missions#new', as: :new_descendent_missions
  patch "/descendents/:id/missions", to: "descendent_missions#index", as: :patch_descendent_missions
  delete "/descendents/:id", to: "descendent_missions#destroy", as: :destroy_descendent_and_missions

  get "/missions", to: "missions#index"
  get "/missions/new", to: "missions#new", as: :new_missions
  get "/missions/:id", to: "missions#show", as: :show_mission
  get '/missions/:id/edit', to: 'missions#edit', as: :edit_mission
  post '/missions', to: 'missions#create', as: :create_mission
  post "/missions/:id", to: "missions#show", as: :post_mission
  patch "/missions/:id", to: "missions#update", as: :update_mission
  delete "/missions/:id", to: "missions#destroy", as: :destroy_missions

  get "/granchildren", to: "grandchildren#index"
  get "/missions/new", to: "grandchildren#new", as: :new_grandchildren
  post "/missions", to: "grandchildren#create", as: :create_grandchildren

end
