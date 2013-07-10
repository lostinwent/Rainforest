Rainforest::Application.routes.draw do
  get    'products'          => 'products#index'
  post   'products'          => 'products#create'
  get    'products/new'      => 'products#new'
  get    'products/:id/edit' => 'products#edit'
  get    'products/:id'      => 'products#show', :as 'product'
  put    'products/:id'      => 'products#update'
  delete 'products/:id'      => 'products#destroy'
  root   :to                 => 'pictures#index'
end