Rails.application.routes.draw do
  resources :posts, only: [:index]
  
  resources :users, except: [:index, :new, :create] do
    resources :posts, except: [:index]
    member do
      get "posts" #, to: "user_posts"
    end
  end  
  devise_for :users, path: "auth"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "index#index"
end
