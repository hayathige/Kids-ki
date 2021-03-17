Rails.application.routes.draw do
  get 'comments/create'
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'notices#index'
  resources :notices do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end
