Rails.application.routes.draw do
  root 'welcome#index'


  resources :users, only: [:new, :create ] do
  end
  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
  end

  resources :auctions do
    resources :bids, only: [:create]
    # resources :publishings, only: [:create]
  end

  resources :bids, only: [:index]


end
