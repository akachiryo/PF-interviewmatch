Rails.application.routes.draw do

  devise_for :admins
  devise_for :users



  namespace :users do
    get "rooms/search" => "rooms#search"
    resources :rooms
  end

  namespace :admins do
    resources :rooms
    resources :time_tags
    resources :ocuupation_tags
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  resources :users, :only => [:show, :edit, :update]
end