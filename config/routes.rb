Rails.application.routes.draw do

  namespace :users do
    get 'rooms/search' => 'rooms#search'
    resources :rooms
  end

  namespace :admins do
    resources :rooms
    resources :time_tags
    resources :ocuupation_tags
  end

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
end