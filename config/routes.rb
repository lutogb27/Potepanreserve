Rails.application.routes.draw do
  get 'home/index'
  get 'reserves/index'
  get 'reservation/index'
  get 'rooms/index'
  devise_for :users
  root to:'home#index'
  get 'users/show'
  resources :users do
  end
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
