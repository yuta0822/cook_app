Rails.application.routes.draw do

  devise_for :users
  get 'cooks/index'
  root to: "cooks#index"
  resources :cooks do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show]
end
