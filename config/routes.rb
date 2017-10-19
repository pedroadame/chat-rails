Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :rooms, only: [:index, :new, :create, :show]
  root to: 'users#new'
end
