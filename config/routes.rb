Rails.application.routes.draw do
  get 'users/profile'
  get 'votes/create'
  get 'votes/destroy'
  get 'recommendations/create'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "books#index"
  resources :books, only: [:index, :new, :create, :show] do
    resources :recommendations, only: [:new, :create]
  end

  resources :recommendations, only: [] do
    resource :vote, only: [:create, :destroy]
  end

  get "/profile", to: "users#profile", as: :profile
  get "/trending", to: "books#trending", as: :trending_books
  get "/recommendations", to: "recommendations#index", as: :recommendations

end
