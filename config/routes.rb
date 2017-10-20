Rails.application.routes.draw do

devise_for :users
  root 'messages#index'
  resources :groups, except: [:destroy,:show, ]
  resources :users, only: [:edit,:update]

end
