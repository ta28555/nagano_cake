Rails.application.routes.draw do

  root to: 'homes#top'
  get '/about' => 'homes#about'

  devise_for :admins
  devise_for :customers

end
