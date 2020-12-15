Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :photos
  resource :favorites, only: [:create, :destroy]
  get 'top' => 'homes#top'
  get 'menu' => 'homes#menu'
end