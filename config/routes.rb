Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins


  root to: 'homes#top'
  get '/about' => 'homes#about'

  resources :items, only: [:index, :show]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :customers, only: [:show, :edit, :update]
  get '/customers/confirm' => 'customers#confirm'
  patch '/customers/unsubscribe' => 'customers#unsubscribe'

  resources :cart_items, except: [:new, :show, :edit]
  delete '/cart_items' => 'cart_items#destroy_all'

  resources :orders, except: [:edit, :update, :destroy]
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/thanks' => 'orders#thanks'

  resources :addresses, except: [:new, :show]

  namespace :admin do
    get '/admin' => 'admin/homes#top'

    resources :sessions, only: [:new, :create, :destroy]
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end
