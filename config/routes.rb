Rails.application.routes.draw do
  devise_for :users, controllers: {       # ← 恐らく最初は”devise_for:”のみの記載かと
    registrations: "users/registrations"
  }
  resources :users, only: [:index, :show]
  root to: 'articles#top'
  get 'tags/:tag_name', to: 'articles#index', as: :tag
  resources :articles do
    resources :likes, only: [:create, :destroy]
  end
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
