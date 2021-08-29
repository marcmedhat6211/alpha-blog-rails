Rails.application.routes.draw do
  #this is how you specify the root route
  #controller #action
  root 'pages#home'
  #request type, route name, controller, action
  get 'about', to: 'pages#about'
end

