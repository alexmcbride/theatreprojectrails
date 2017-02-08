Rails.application.routes.draw do
  resources :categories
  resources :posts
  devise_for :users
  get 'home/index'
  get 'home/contact'
  get 'blog/:id', to: 'posts#index', as: 'category_posts'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
