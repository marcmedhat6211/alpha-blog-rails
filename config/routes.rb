Rails.application.routes.draw do
  #this is how you specify the root route
  #controller #action
  root 'pages#home'
  #request type, route name, controller, action
  get 'about', to: 'pages#about'
  # only show dyh y3ny hatly bs el route el taba3 el show action w eliminate el ba2y
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  # The resources keyword provides REST-ful routes to Rails resources
  # and resources here means: for ex article is a resource
  # REST - Representational state transfer - mapping HTTP verbs (get, post, put/patch, delete)
  resources :articles
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
end

