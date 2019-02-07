Rails.application.routes.draw do
  get '/groups/new' => 'groups#new'
  post '/groups' => 'groups#create'  
  get '/groups/edit' => 'groups#edit'
  post '/groups/edit' => 'groups#update'
  get 'groups/delete' => 'groups#delete'
  get 'groups/show' => 'groups#show'  
  
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'  
  get '/products/edit' => 'products#edit'
  post '/products/edit' => 'products#update'
  get 'products/delete' => 'products#delete'
  get 'products/show' => 'products#show' 
  
  resources :groups
  resources :products
  root "groups#index"
end
