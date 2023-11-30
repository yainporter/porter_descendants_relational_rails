Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"
  get "/descendents", to: "descendents#index"
  get "/descendents/new", to: "descendents#new"
  post "/descendents", to: "descendents#create"
  get '/descendents/:id', to: 'descendents#show'
  get "/missions", to: "missions#index"
  get "/missions/new", to: "missions#new"
  post '/missions', to: 'missions#create'
  get "/missions/:id", to: "missions#show"
end
