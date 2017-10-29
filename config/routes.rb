Rails.application.routes.draw do

  resources :rooms, only: [:index, :new, :create, :show] do
    member do
      resources :messages, only: [:create]
    end
  end

  root to: 'home#index'
  mount ActionCable.server => '/cable'
end
