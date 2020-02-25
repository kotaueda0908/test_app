Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :users, only: [:index, :show]
  resources :articles do
    resources :likes, only: [:create, :destroy]
  end
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
