Rails.application.routes.draw do

  resources :users, only: [:new, :create, :edit, :update] do
    member do
      post 'logout' => 'users#logout', as: 'logout'
    end
  end

  resources :rooms, only: [:index, :new, :create, :show] do
    member do
      resources :messages, only: [:create]
    end
  end

  root to: 'users#new'
  mount ActionCable.server => '/cable'
end
