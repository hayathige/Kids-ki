Rails.application.routes.draw do
  get 'groups/show'
  get 'top/index'
  get 'comments/create'
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'
  resources :notices do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:new, :show, :update]
  resources :groups, only: [:show, :edit, :update]
end
