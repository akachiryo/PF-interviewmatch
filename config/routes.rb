Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :users do
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
    resources :time_tags
    resources :ocuupation_tags
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  resources :users, :only => [:show, :edit, :update]
  resources :room_chats, only: [:create]
  resources :rooms, only: [:create,:show]

end
