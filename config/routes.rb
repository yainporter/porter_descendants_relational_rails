Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"
  get "/descendents", to: "descendents#index"
  get "/descendents/new", to: "descendents#new"
  post "/descendents", to: "descendents#create"
  get '/descendents/:id', to: 'descendents#show'
  get '/descendents/:id/missions', to: 'descendent_missions#index'
  post '/descendents/:id/missions', to: 'descendent_missions#create'
  get '/descendents/:id/edit', to: 'descendents#edit'
  patch 'descendents/:id', to: 'descendents#update'
  get "/descendents/:id/missions/new", to: 'descendent_missions#new'
  get "/missions", to: "missions#index"
  post '/missions', to: 'missions#create'
  get "/missions/:id", to: "missions#show"
end
