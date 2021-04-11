Rails.application.routes.draw do
  devise_for :users
  #get 'home/index' #<- this is the route for localhost:3000/home/index
  resources :users
  resources :meetings
  resources :tasks do
    member do
      get :countdown_timer
    end
    # https://guides.rubyonrails.org/routing.html#adding-member-routes
  end

  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
