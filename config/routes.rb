Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :photos
  get 'top' => 'homes#top'
  get 'menu' => 'homes#menu'
end