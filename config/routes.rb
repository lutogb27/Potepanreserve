Rails.application.routes.draw do
  get 'home/index'
  get 'reserves/index'
  get 'reservation/index'
  get 'rooms/index'
  devise_for :users
  resources :users do
  end
  root 'home#index'
  get 'users/show'
  resources :rooms do
    collection do
      get "search"
    end
  end
  resources :reservations do
    collection do
    post 'confirm'
    end
  end
  resources :reservations
end
