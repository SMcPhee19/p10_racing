# frozen_string_literal: true

Rails.application.routes.draw do
  # get '/', redirect: '/dashboard'
  # get '/dashboard', to: 'dashboard#index'
  get '/dashboard', to: 'dashboard#index'
  get '/', to: redirect('dashboard')
  resources :sessions, only: %i[new create]
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  resources :password_resets, only: %i[new create edit update]
  post 'guest_sessions', to: 'sessions#guest_login'

  resources :user_picks
  resources :user_seasons
  resources :users, param: :username do
    resources :user_picks, only: [:index], controller: 'users/user_picks'
  end
  resources :seasons
  resources :leaderboard, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
