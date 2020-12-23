Rails.application.routes.draw do
  get 'users/show'
  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :photos do
    resource :favorites, only: [:create, :destroy]
  end
  get 'top' => 'homes#top'
  get 'menu' => 'homes#menu'
  get 'access' => 'homes#access'
end