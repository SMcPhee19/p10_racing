# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'dashboard#index'

  resources :user_picks
  resources :user_seasons
  resources :users do
    resources :user_picks, only: [:index], controller: 'users/user_picks'
  end
  resources :seasons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
