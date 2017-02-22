Rails.application.routes.draw do
  resources :categories
  resources :posts
  resources :users
  resources :comments

  devise_for :users, path: 'auth'
  get 'home/index'
  get 'home/contact'
  get 'blog/category/:id', to: 'posts#category', as: 'posts_category'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
