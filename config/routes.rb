# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'dashboard#index'

  resources :user_picks
  resources :user_seasons
  resources :users
  resources :seasons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
