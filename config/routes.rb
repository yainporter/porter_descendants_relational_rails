Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"
  get "/descendants", to: "descendants#index"
  get "/descendants/new", to: "descendants#new"
  post "/descendants", to: "descendants#create"
  get "/missions", to: "missions#index"
  get "/missions/new", to: "missions#new"
  post '/missions', to: 'missions#create'
end
