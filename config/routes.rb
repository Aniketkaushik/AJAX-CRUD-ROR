Rails.application.routes.draw do

  resources :tasks do 
    resources :comments, only: [:create]
  end 

  devise_for :users
  root 'tasks#index'
  
  resources :tasks
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
