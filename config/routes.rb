Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  resource :sessions, only: %i(destroy create new)
  resources :users
  resources :workers
  resource :worker_accounts, only: %i(show edit)
end
