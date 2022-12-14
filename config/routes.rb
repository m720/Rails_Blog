Rails.application.routes.draw do
  resources :tags_posts
  resources :comments_posts
  resources :comments
  resources :tags
  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'users', to: 'users#index'
  # post 'users', to: 'users#create'

  post '/login', to: "users#login"
  post '/register', to: "users#create"
  get 'startPostsJob', to: "start_job#trigger_job"
end
