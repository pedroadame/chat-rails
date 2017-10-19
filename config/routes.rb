Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resources :rooms, only: [:index, :new, :create, :show] do
    member do
      resources :messages, only: [:create]
    end
  end
  root to: 'users#new'
end
