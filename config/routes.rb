Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  get   'inquiry/index' => 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_for :admins

  namespace :users do
    get 'tags/mysearch' => 'tags#mysearch'
    get 'tags/search' => 'tags#search'
    get 'rooms/search' => 'rooms#search'
    get 'rooms/finish' => 'rooms#finish'
    resources :rooms
    resources :user_rooms, only: %i[create update]
    resources :room_chats, only: %i[create destroy]
    resources :relationships, only: %i[create destroy]
    resources :schedules
    resources :dmmessages, only: [:create]
    resources :dmrooms, only: %i[create show]
    resources :notifications, only: [:index]
  end

  namespace :admins do
    resources :rooms
    resources :tags, only: %i[index edit update destroy]
    resources :users, only: %i[index show edit update]
  end

  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  resources :users, only: %i[show edit update]
  resources :room_chats, only: [:create]
  resources :rooms, only: %i[create show]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
