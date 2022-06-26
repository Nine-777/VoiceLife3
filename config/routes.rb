Rails.application.routes.draw do
  # get 'comments/create'
  # get 'comments/destroy'
  root "homes#index"
  # devise_for :users
  # post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  resources :users
  resources :posts
  # resources :posts do
  #   resources :comments, only: [:create]
  # end
  get 'search' => 'posts#search'
end
