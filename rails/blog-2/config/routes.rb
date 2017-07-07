Rails.application.routes.draw do
  devise_for :users, path: "auth"
  
  # resources :posts, only: [:index]
  
  resources :users, except: [:index, :new, :create] do
    resources :posts, except: [:index]
    member do
      get "posts" #, to: "user_posts"
    end
  end
  resources :posts, except: [:index] do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "index#index"
end
