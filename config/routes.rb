Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  get "/shop", to: "shop#index", as: "shop"
  get "/about", to: "about#index", as: "about"
  get "/reviews", to: "reviews#index", as: "reviews"
  get "/contact", to: "contact#index", as: "contact"
end
