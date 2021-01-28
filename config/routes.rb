Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :photos do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get 'top' => 'homes#top'
  get 'menu' => 'homes#menu'
  get 'access' => 'homes#access'
end