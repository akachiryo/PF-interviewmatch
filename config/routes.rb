Rails.application.routes.draw do
  root  'homes#top'
  get 'homes/abput' => 'homes#about'
  get   'inquiry/index' => 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'

  devise_for :users
  devise_for :admins

  namespace :users do
    get "tags/search" => "tags#search"
    get "rooms/search" => "rooms#search"
    get "rooms/finish" => "rooms#finish"
    resources :rooms
    resources :user_rooms, only: [:create, :update]
    resources :room_chats, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
    resources :schedules
    resources :dmmessages, only: [:create]
    resources :dmrooms, only: [:create,:show]
    resources :notifications, only: [:index]
  end

  namespace :admins do
    resources :rooms
    resources :tags, only: [:index, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end

  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  resources :users, :only => [:show, :edit, :update]
  resources :room_chats, only: [:create]
  resources :rooms, only: [:create,:show]

end
