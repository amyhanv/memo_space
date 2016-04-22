Rails.application.routes.draw do
  devise_for :users
  resources :messages #generate a bunch of url for our msg controller
  root 'messages#index' #controller#action
end
