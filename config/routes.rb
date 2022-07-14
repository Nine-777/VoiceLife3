Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  root "homes#index"
  devise_for :users
  get 'search' => 'posts#search'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :comments
  resources :posts, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end