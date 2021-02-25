Rails.application.routes.draw do
  devise_for :users
  #get 'home/index' #<- this is the route for localhost:3000/home/index
  resources :users

  root to: "home#index"

  get 'meetings/show'
  get 'calendar/index'

  get 'calendar/_calendar'

  get 'meetings/new'
  post 'meetings/new'

  get 'calendar/mainCalendar'


  get 'meeting', to: 'meetings#new'
  post 'meeting', to: 'meetings#create'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end






