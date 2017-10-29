Rails.application.routes.draw do

  resources :rooms, only: [:index, :create, :show] 
  root to: 'home#index'
  mount ActionCable.server => '/cable'
end
