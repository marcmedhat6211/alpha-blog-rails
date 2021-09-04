Rails.application.routes.draw do
  #this is how you specify the root route
  #controller #action
  root 'pages#home'
  #request type, route name, controller, action
  get 'about', to: 'pages#about'
  # only show dyh y3ny hatly bs el route el taba3 el show action w eliminate el ba2y
  resources :articles, only: [:show, :index, :new, :create, :edit, :update]
end

