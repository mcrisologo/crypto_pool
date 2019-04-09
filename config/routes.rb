# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
