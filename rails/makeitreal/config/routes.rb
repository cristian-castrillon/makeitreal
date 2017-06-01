Rails.application.routes.draw do
  get 'holi/crear'

  get 'holi/actualizar'

  get "holi/products", as: "products"

  get 'holi/ver(/:name)', to: "holi#ver", as: "products/product"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "index", to: "index#holi"
  # get "index" => "index#holi"

  root "index#root"

  # get "products", to: "product#index"

end
