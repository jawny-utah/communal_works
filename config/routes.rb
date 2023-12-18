Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  resource :sessions, only: %i(destroy create new)
  resources :users
  resources :workers
  resource :worker_accounts, only: %i(show edit) do
    get :service_orders, on: :collection
  end
  resources :services do
    resources :service_orders, only: %i(new)
  end
  resources :service_orders, except: :new do
    get :cancellation_reason, on: :member
    get :rate, on: :member
  end
  resource :personal_informations, only: %i(show edit update)
  resources :notifications, only: %i(index destroy) do
    collection do
      delete :destroy_all
    end
  end
end
