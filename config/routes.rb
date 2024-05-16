Rails.application.routes.draw do
  root 'books#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'register' => 'users#new'
  post 'register' => 'users#create'

  get 'books' => 'books#index'
  get 'books/:id' => 'books#show'

  resources :users, except: [:new]
  resources :books
  resources :borrows



  # get 'borrows/create'
  # get 'borrows/destroy'
  # get 'books/index'
  # get 'books/show'
  # get 'users/new'
  # get 'users/create'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
