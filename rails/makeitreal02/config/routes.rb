Rails.application.routes.draw do
  devise_for :users
  resources :invoices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  resources :users, except: [:new] do
    collection do
      get "sign_up", to: "users#new"
    end
  end
  get "search", to: "index#search"
  root "index#index"
end
