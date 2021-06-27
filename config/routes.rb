Rails.application.routes.draw do

  devise_for :customers, :controllers => {
    :sessions => 'public/sessions',
    :registrations => 'public/registrations'
  }

  devise_for :admin, :controllers => {
    :sessions => 'admin/sessions',
    :registrations => 'admin/registrations'
  }


  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'

    resources :items, only: [:index, :show]

    resource :customers, only: [:edit, :update]
    get '/customers/my_page' => 'customers#show'
    get '/customers/confirm' => 'customers#confirm'
    patch '/customers/unsubscribe' => 'customers#unsubscribe'


    delete '/cart_items' => 'cart_items#destroy_all'
    resources :cart_items, except: [:new, :show, :edit]

    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'
    resources :orders, except: [:edit, :update, :destroy]


    resources :addresses, except: [:new, :show]
  end

  namespace :admin do
    root to: 'homes#top'

    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end
